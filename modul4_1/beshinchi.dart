
void main(){
  List<int> a = [1,2,3,4,8,57,7,1,2,8,8,3,46,56,1,2,3,4,8,57,7];
  List<int> b = [1,2,8,8,3,46,56,1,2,3,4,8,57,7,1,2,6,7,88,8];
  List<int> c = [];

  for (var aa in a) {
    for (var bb in b) {
      if (aa == bb){
        if (c.contains(aa)){
          continue;
        }else{
          c.add(aa);
        }
      }
    }
  }
  print(c);
}