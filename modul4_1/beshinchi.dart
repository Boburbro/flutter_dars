
void main(){
  List<int> a = [1,2,3,4,8,57,7,7];
  List<int> b = [1,2,8,8,3,46,56];
  List<int> c = [];
  for (var aa in a) {
    if (b.contains(aa)){
      c.add(aa);
    }
  }
  print(c);
}