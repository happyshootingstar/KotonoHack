import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

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
  List<dynamic> dataList = [];
  int offset = 0;
  Future <void> fetchData()async {
    Response response = await Dio().get(
      "https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?q=琴葉 茜 OR 葵 OR 姉妹&targets=tags&fields=contentId,title,contentId,thumbnailUrl,viewCounter,genre&filters[viewCounter][gte]=0&filters[genre][0]=音楽・サウンド&_sort=-startTime&_offset=" + offset.toString() + "&_limit=30&_context=Kotono Hack",
      options: Options(
          headers:<String, dynamic> {
            'User-Agent':'Kotono Hack',
          }
      ),
    );
    // if(dataList.length == 0) dataList = response.data['data'];
    dataList.addAll(response.data['data']);

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
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[50],
        centerTitle: true,
        title: Text(
          "Kotono Music",
          style:TextStyle(
            color:Colors.pink[200],
            letterSpacing: 2.0,
            fontFamily: "Patrick_Hand",
          ),
        ) ,
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
        ],
      ),
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index){
          Map<String, dynamic> data = dataList[index];
          if(index != dataList.length - 1){
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
          }else{
            //リストの一番下に[more]ボタンを表示
            return OutlinedButton(
              child: Text(
                'show more',
                style: new TextStyle(
                  fontSize: 13,
                  color: Colors.blue[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => {
                setState(() {
                  //[more]ボタンが押されたら、30件増やしてデータを再取得(ver1.03)
                  offset += 30;
                  fetchData();
                },
                )
              },
            );
          }
        },
      ),
    );
  }
}
