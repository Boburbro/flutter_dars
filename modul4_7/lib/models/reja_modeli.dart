class RejaModeli{
  final String id; 
  final String nomi;
  final DateTime kuni;
  bool isDone = false;

  RejaModeli(
    {
      required this.id,
      required this.nomi,
      required this.kuni
    }
  );

  void changeIsDone(){
    isDone = !isDone;
  }
}

class Rejalar{
  List<RejaModeli> _ruyxat = [
    RejaModeli(id: "r1", nomi: "Bozorga borish", kuni: DateTime.now()),
    RejaModeli(id: "r2", nomi: "Bozordan kelish", kuni: DateTime.now()),
    RejaModeli(id: "r3", nomi: "Kitob o'qish", kuni: DateTime.now()),
  ];

  List<RejaModeli> get ruyxat{
    return _ruyxat;
  } 
}

