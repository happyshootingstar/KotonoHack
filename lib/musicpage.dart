import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicPage extends  StatelessWidget{
  const MusicPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KotonohaMusic(),
    );
  }
}

class KotonohaMusic extends StatefulWidget {
  const KotonohaMusic ({super.key});
  @override
  State<KotonohaMusic> createState() => KotonohaMusicPage();
}
//API取得
class KotonohaMusicPage extends State <KotonohaMusic>{
  List dataList = [];
  Future <void> fetchData()async {
    Response response = await Dio().get(
      "https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?q=琴葉 茜 OR 葵 OR 姉妹　-ミク&targets=tags&fields=contentId,title,contentId,thumbnailUrl,viewCounter,genre&filters[viewCounter][gte]=200&filters[genre][0]=音楽・サウンド&_sort=-startTime&_offset=0&_limit=60&_context=Kotono Hack",

      options: Options(
          headers:<String, dynamic> {
            'User-Agent':'Kotono Hack',
          }
      ),
    );
    dataList = response.data['data'];
    setState((){});
    //テストprint(dataList);
  }
  @override
  void initState(){
    super.initState();
    fetchData();
  }
//  表示画面
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blue[50],
        centerTitle: true,
        title: Text(
          "Kotono Music",
          style:TextStyle(
            color:Colors.pink[200],
            letterSpacing: 1.0,
            fontFamily: "Patrick_Hand",
          ),
        ) ,
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index){
          Map<String, dynamic> data = dataList[index];
          return Card(
            child: InkWell(
                onTap: () async{
                  var url = 'https://nico.ms/'+data['contentId'];
                  if (await canLaunch(url)){
                    await launch(url);
                  }
                },
                child: Column(
                  children:<Widget> [
                    ListTile(
                      leading:Container(
                        width: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(data['thumbnailUrl']),
                        ),
                      ),
                    ),
                      title: Text(
                        data['title'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                          fontSize: 13,
                          color: Colors.pink[200],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
        },
      ),
    );
  }
}