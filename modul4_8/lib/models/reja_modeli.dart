class RejaModeli{
  final String rID;
  final String name;
  final DateTime date;
  bool isDone = false;

  RejaModeli(
    {
      required this.rID,
      required this.name,
      required this.date
    }
  );

  void changeIsDone(){
    isDone = !isDone;
  }

}

class Rejalar{
  List<RejaModeli> _ruyxat = [
    RejaModeli(rID: 'r1', name: "@ITwithBobur kanaliga obun bo'lish", date: DateTime.now())
  ];

   List<RejaModeli> get ruyxat {
    return _ruyxat;
  }

  List<RejaModeli> todoByDay(DateTime day){
    return _ruyxat.where((reja) => reja.date.day == day.day && reja.date.month == day.month && reja.date.year == day.year).toList();
  }
  void addToDoAsNew(String nomi, DateTime vaqti){
    _ruyxat.add(RejaModeli(rID: "r${_ruyxat.length+1}", name: nomi, date: vaqti));
  }
}