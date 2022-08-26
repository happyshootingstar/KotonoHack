import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';

class NicoNicoPage extends StatelessWidget {
  const NicoNicoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NicoNicoHome(),
    );
  }
}

class NicoNicoHome extends StatefulWidget {
  const NicoNicoHome ({super.key});
  @override
  State<NicoNicoHome> createState() => KotonohaMovie();
}
//API取得
class KotonohaMovie extends State <NicoNicoHome>{
  List<dynamic> dataList = [];
  int offset = 0;
  //offsetの定義
  Future<void> fetchData()async {
    Response response = await Dio().get(
        "https://api.search.nicovideo.jp/api/v2/snapshot/video/contents/search?q=琴葉 茜 OR 葵 OR 姉妹 &targets=tags&fields=contentId,title,contentId,thumbnailUrl,viewCounter,genre&filters[viewCounter][gte]=0&_sort=-startTime&_offset=" + offset.toString() + "&_limit=33&_context=Kotono Hack",
    options: Options(
      headers:<String, dynamic> {
        'User-Agent':'Kotono Hack'
        }
      ),
    );
    // dataList=response.data['data'];
    dataList.addAll(response.data['data']);
    setState(() {});
    //テスト print(dataList);
  }
  @override
  void initState(){
    super.initState();
    fetchData();
  }
  //表示画面
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[50],
        centerTitle: true,
        title: Text(
          "Kotono Movie",
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
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5.0,
              crossAxisCount: 3,
              crossAxisSpacing: 4,
          ),
          itemCount: dataList.length ,
          itemBuilder: (context, int index){
            Map<String, dynamic> data = dataList[index];
            if(index != dataList.length -1){
            return InkWell(
              onTap: () async{
                var url = 'https://nico.ms/'+data['contentId'];
                if (await canLaunch(url)){
                  await launch(url);
                }
              },
                child: Column(
                  children:<Widget> [
                    Image.network(data['thumbnailUrl']
                    ),
                    Text(
                        data['title'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: new TextStyle(
                      fontSize: 15,
                      color: Colors.pink[200],
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
            );
          }
          else{
            return OutlinedButton(
              child: Text(
                'show more',
                style: new TextStyle(
                  fontSize: 13,
                  color: Colors.blue[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
            onPressed: ()=> {
              setState((){
                offset += 33;
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