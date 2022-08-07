import 'package:flutter/material.dart';
import 'bookpage.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blue[50],
       centerTitle: true,
       title: Text(
           '各アプリの検索方法',
         style: TextStyle(
           color: Colors.pink[200],
           letterSpacing: 2.0,
         ),
       ),
     ),
     body:SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Container(
               width: double.infinity,
               child: Column(
                 children: [
                   Text(
                     'Twitter',
                     style: TextStyle(
                       fontSize: 40,
                       color: Colors.black87,
                     ),
                   ),
                   Text(
                       '琴葉茜＆葵公式twitter(@kotonoha0425) 様のtwitter情報を取得しています。',
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.black87,
                     ),
                   ),
                 ],
               ),
               decoration: BoxDecoration(
                 border: Border(
                   bottom: BorderSide(
                     color: Colors.lightBlueAccent,
                     width: 3,
                   ),
                 ),
               ),
             ),
           ],
       ),
     )

   );
  }
}
