import 'dart:io';

void main(){
  List<int> number = [];
  print("Raqam kiriting!");

  var raqam = int.parse(stdin.readLineSync()!);

  for (int n = 1 ; n <= raqam; n++){
    if (raqam % n == 0){
    number.add(n);
    }
  }
  print(number);
}