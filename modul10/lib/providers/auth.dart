// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modul10/service/http_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

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
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signUp(String email, String password) async {
    return authorize(email, password, true);
  }

  Future<void> signIn(String email, String password) async {
    return authorize(email, password, false);
  }

  void logout() {
    _token = null;
    _expiryDate = null;
    _userId = null;
    notifyListeners();
  }
}
