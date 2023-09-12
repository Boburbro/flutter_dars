import 'dart:io';
void main(){
  // print("object");

  // String malumot = stdin.readLineSync()!;

  // print(malumot);
  // int raqam = int.parse(stdin.readLineSync()!);

  // print(2 + raqam);

  // if (raqam == 8){
  //   print(raqam + 2);
  // }else if (raqam == 9){
  //   print(raqam + 1);
  // }else{
  //   print(raqam);
  // }
  print("Ismingizni kiriting:");
  String name = stdin.readLineSync()!;
  print("Salom, $name endi yoshingizni kiriting:");
  int age = int.parse(stdin.readLineSync()!);
  print("$name, siz 100 yoshga kirish uchun ${getAge(age)} qoldi");



}

int getAge(int age){
  if (age < 100){
    return 100 - age;
  }
  else{
    return 0;
  }
}