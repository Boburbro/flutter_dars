import 'dart:io';

void main(){
  print("Bironta so'z kiriting:");
  String a  = stdin.readLineSync()!;
  tekshir(a);
  
}


void tekshir(word){
  String a = word.toLowerCase();
  List<String> b = [];
  List<String> c = [];
  int n = 0;
  
  for (var i = 0; i < a.length; i++) {
    b.add(a[i]);
    c.insert(0, a[i]); 
  }
  for (var i = 0; i < b.length; i++){
    if (b[i] == c[i]){
      n++;
    }
  }
  if (b.length == n){
    print("$word so'zi polindrom so'z");
  }else{
    print("$word so'zi polindrom so'z emas");
  }
}