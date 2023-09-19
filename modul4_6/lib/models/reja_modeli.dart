class RejaModeli{
  final String id;
  final String nomi;
  final DateTime kuni;
  bool isDane = false;

  RejaModeli(
    {
      required this.id, 
      required this.nomi, 
      required this.kuni
    }
  );

  void changeIsDone(){
    isDane = !isDane;
  }
}

class Rejalar{
  List<RejaModeli> _ruyxat = [
    RejaModeli(id: "r1", nomi: "todo", kuni: DateTime.now()),
  ];

  List<RejaModeli> get ruyxat{
    return _ruyxat;
  }
}