void main(){
  List<int> raqam = [1,2,3,4,5,6,7,8,9,10,11,12,13];
  print("Bu 5 dan kichik sonlar");
  for(var tartibRaqam = 0; tartibRaqam < raqam.length; tartibRaqam++){
    if (raqam[tartibRaqam] < 5){
      print(raqam[tartibRaqam]);
    }
  }
  print("Bu toq sonlar:");
  for(var tartibRaqam = 0; tartibRaqam < raqam.length; tartibRaqam++){
    if (raqam[tartibRaqam] % 2 != 0){
      print(raqam[tartibRaqam]);
    }
  }
}