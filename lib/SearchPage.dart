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
               margin: EdgeInsets.only(
                 top: 10,
               ),
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
             Container(
               padding: EdgeInsets.only(
                   top: 10,
                   bottom:10
               ),
               width: double.infinity,
               child: Column(
                 children: [
                   Text(
                     'Movie',
                     style: TextStyle(
                       fontSize: 40,
                       color: Colors.black87,
                     ),
                   ),
                   Text(
                     'ニコニコ動画のタグ、タイトルに『琴葉』を含み、かつ『茜』または『葵』を含んだ再生回数200回以上の新着順の上位66件です。',
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
                     color:Colors.lightBlueAccent,
                     width: 3,
                   ),
                 ),
               ),
             ),
             Container(
               padding: EdgeInsets.only(
                   bottom:10,
               ),
               width: double.infinity,
               child: Column(
                 children: [
                   Text(
                     'Music',
                     style: TextStyle(
                       fontSize: 40,
                       color: Colors.black87,
                     ),
                   ),
                   Text(
                     'ニコニコ動画のジャンルタグ、タイトルに『琴葉』を含み、かつ『茜』または『葵』を含んだジャンル『音楽・サウンド』の再生回数200回以上の新着順上位60件です。',
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
             Container(
               width: double.infinity,
               child: Column(
                 children: [
                   Text(
                     'Goods Shoop',
                     style: TextStyle(
                       fontSize: 40,
                       color: Colors.black87,
                     ),
                   ),
                   Text(
                     '株式会社エーアイ 様の公式ショップのURLにに繋がっています。\n  (https://aivoice.thebase.in/items/40252950)',
                     style: TextStyle(
                       fontSize: 18,
                       color: Colors.black87,
                     ),
                   ),
                 ],
               ),
               padding: EdgeInsets.only(
                 bottom: 3.0
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
