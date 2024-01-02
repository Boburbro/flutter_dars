// ignore_for_file: unused_field

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul10/service/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  Timer? _timer;

  static const apiKey = ' AIzaSyDqIElSZucOOu4Yqzo6LwB7c2Kco-U8emg';

  bool get isAuth {
    return _token != null;
  }

  String? get userId {
    return _userId;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> authorize(String email, String password, bool isSignUp) async {
    try {
      if (isSignUp) {
        final url = Uri.parse(
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey",
        );
        final response = await http.post(
          url,
          body: jsonEncode(
            {
              'email': email,
              'password': password,
              'returnSecureToken': true,
            },
          ),
        );
        final data = jsonDecode(response.body);
        if (data['error'] != null) {
          throw HttpException(message: data['error']['message']);
        }
        _token = data['idToken'];
        _expiryDate =
            DateTime.now().add(Duration(seconds: int.parse(data['expiresIn'])));
        _userId = data['localId'];
      } else {
        final url = Uri.parse(
            "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey");
        final response = await http.post(
          url,
          body: jsonEncode(
            {
              'email': email,
              'password': password,
              'returnSecureToken': true,
            },
          ),
        );
        final data = jsonDecode(response.body);
        if (data['error'] != null) {
          throw HttpException(message: data['error']['message']);
        }
        _token = data['idToken'];
        _expiryDate =
            DateTime.now().add(Duration(seconds: int.parse(data['expiresIn'])));
        _userId = data['localId'];
        _autoLogout();
        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final userData = jsonEncode({
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate!.toIso8601String(),
        });
        prefs.setString('userData', userData);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }

    final userData =
        jsonDecode((prefs.getString('userData'))!) as Map<String, dynamic>;

    final expiryDate = DateTime.parse(userData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = userData['token'];
    _userId = userData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> signUp(String email, String password) async {
    return authorize(email, password, true);
  }

  Future<void> signIn(String email, String password) async {
    return authorize(email, password, false);
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    _userId = null;
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_token == null) {
      _timer!.cancel();
    }
    _timer = Timer(
        Duration(seconds: _expiryDate!.difference(DateTime.now()).inSeconds),
        logout);
  }
}
