import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modul4_3/widgets/DATA.dart';
import 'package:modul4_3/widgets/todo.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("ToDo"), centerTitle: true,),
        body: SafeArea(
        child: Column(
          children: [
            DATA(),
            ToDo(),
            Expanded(
              child: ListView.builder(itemBuilder: (ctx, index){
                return ListTile(
                  leading: IconButton(onPressed: () {}, icon: Icon(Icons.circle_outlined)),
                  title: Text("Bozorga borish", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),),
                  trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever_rounded, size: 20,)),
                );
              },
              itemCount: 5,),
            )
          ],
        ),
        ),

      ),
    );
  }
}

