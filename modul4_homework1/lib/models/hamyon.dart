
class Hamyon{
  final String rId;
  final String nomi;
  final int summa;
  final DateTime vaqti;

  Hamyon(
    {
      required this.rId,
      required this.nomi,
      required this.summa,
      required this.vaqti,
    }
  );

  

}

class Xisob{
  List<Hamyon> _ruyxat = [
    Hamyon(
      rId: "r1", 
      nomi: "Non", 
      summa: 9000, 
      vaqti: DateTime.now()
      ),
    Hamyon(
      rId: "r2", 
      nomi: "Suv", 
      summa: 3000, 
      vaqti: DateTime.now()
      )
  ];

  List<Hamyon> get ruyxat {
    return _ruyxat;
  }

  List<Hamyon> allManeyByMonth(DateTime month1){
    return _ruyxat.where((monthOn) => monthOn.vaqti.year == month1.year && monthOn.vaqti.month == month1.month).toList();
  }

  void addNewChack(String nomi, int summa, DateTime vaqti){
    _ruyxat.add(Hamyon(rId: "r${_ruyxat.length + 1}", nomi: nomi, summa: summa, vaqti: vaqti));
  }

  void removee(String rId){
    _ruyxat.removeWhere((element) => element.rId == rId);
  }

  void addNewRuyxat(String nomi, int summa, DateTime vaqti){
    _ruyxat.add(Hamyon(rId: "r${_ruyxat.length+1}", nomi: nomi, summa: summa, vaqti: vaqti));
  }


}

class HamyonLimit{
  int limit = 100000;
  final int rId;

  HamyonLimit({
    required this.rId
  });

  void changLimit(int newLimit){
    limit = newLimit;
  }
}

class XisobLimit{
  List<HamyonLimit> _list = [
    HamyonLimit(rId: 1),
  ];

  List<HamyonLimit> get lists{
    return _list;
  }

  List<HamyonLimit> getLimit(){
    return _list.toList();
  }
}


