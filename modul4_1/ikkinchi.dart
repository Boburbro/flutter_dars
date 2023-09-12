import 'dart:io';

void main(){
  print("Ixtiyoriy raqam kirirting:");
  int number = int.parse(stdin.readLineSync()!);

  if (number%2==0){
    print("Siz kiritgan son juft son");
  }else{
    print("Siz kiritgan son toq son");
  }

}