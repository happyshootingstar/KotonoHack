import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kotonohack/musicpage.dart';
import 'package:kotonohack/niconicopage.dart';
import 'package:kotonohack/twitter_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bookpage.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Kotono Hack app';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Colors.deepOrange[100],
      debugShowCheckedModeBanner: false,
      title: 'Kotono Hack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()
    );
  }
}

class Home extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[50],
        centerTitle: true,
        title: Text(
          "Kotono Hack",
          style:TextStyle(
            color:Colors.pink[200],
            letterSpacing: 2.0,
            fontFamily: "Patrick_Hand",
          ),
        ) ,
        actions: [
          IconButton(
            color: Colors.pink[200],
            icon: Icon(Icons.account_box),
            onPressed: () => {
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context)  => BookPage()
                ),
              )
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget> [
            Container(
              width: double.infinity,
              height:200,
              child: FlatButton(
                color: Colors.deepPurple[50],
                child: Container(
                  width: double.infinity,
                  height:200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage('assets/images/twitterpng.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Text('Twitter',
                    style: TextStyle(
                      fontFamily: "Patrick_Hand",
                      color:Colors.black54,
                      fontSize: 50,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)  => TwitterPageInterface()),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height:200,
              child: FlatButton(
                color: Colors.deepPurple[50],
                child: Container(
                  width: double.infinity,
                  height:250,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/movie.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    border: Border(
                  bottom: BorderSide(
                  width: 2,
                    color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Text('Movie',
                    style: TextStyle(
                      fontFamily: "Patrick_Hand",
                      color:Colors.black54,
                      fontSize: 50,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)  => NicoNicoPage()),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height:200,
              child: FlatButton(
                color: Colors.deepPurple[50],
                child: Container(
                  width: double.infinity,
                  height:200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image:AssetImage('assets/images/SD4座り姉妹.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Text('Music',
                    style: TextStyle(
                      fontFamily: "Patrick_Hand",
                      color:Colors.black54,
                      fontSize: 50,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)  => MusicPage()),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height:150,
              child: FlatButton(
                color: Colors.deepPurple[50],
                child: Container(
                  width: double.infinity,
                  height:150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/SD3姉妹.png'),
                        fit: BoxFit.fitWidth,
                      ),
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                  child: Text('Shoop',
                    style: TextStyle(
                      fontFamily: "Patrick_Hand",
                      color:Colors.black54,
                      fontSize: 50,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                onPressed: () async {
                  String url = Uri.encodeFull("https://aivoice.thebase.in/items/40252950");
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.deepPurple[50],
              child: Text(
                  '画像は琴葉茜 琴葉葵 (c) AI Inc.',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

