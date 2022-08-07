import 'package:flutter/material.dart';
import 'package:kotonohack/SearchPage.dart';
import 'TermsPage.dart';
import 'main.dart';

class BookPage extends StatelessWidget{
  const BookPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookPageHome(),
    );
  }
}
class BookPageHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor:  Colors.blue[50],
       centerTitle: true,
       title: Text(
           'その他',
         style:TextStyle(
           color:Colors.pink[200],
           letterSpacing: 1.0,
           fontFamily: "Patrick_Hand",
         ),
       ),
       actions: [
       IconButton(
         color: Colors.pink[200],
         icon: Icon(Icons.home),
         onPressed: () => {
         Navigator.push(
           context,
           MaterialPageRoute(
               builder: (context) => Home()),
           )
         },
       )
       ]
     ),
     body: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           Container(
             width: double.infinity,
             height: 70,
             child: RaisedButton(
               color:Colors.deepPurple[50],
                 child: Container(
                   child: Text(
                       '利用規約',
                   style: TextStyle(
                     color: Colors.black87,
                     fontSize: 20,
                     letterSpacing: 1.0,
                     ),
                   ),
                 ),
               onPressed: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context)  => TermsPage()),
                 );
               },
             ),
           ),
           Container(
             width: double.infinity,
             height: 70,
             child: RaisedButton(
               color:Colors.deepPurple[50],
               child: Container(
                 child: Text(
                   'アプリの検索方法について',
                   style: TextStyle(
                     color: Colors.black87,
                     fontSize: 20,
                     letterSpacing: 1.0,
                   ),
                 ),
               ),
               onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context)  => SearchPage()),
                 );
               },
             ),
           ),
         ],
       ),
     )
   );
  }
}
