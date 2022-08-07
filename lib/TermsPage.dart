import 'package:flutter/material.dart';
import 'bookpage.dart';

class TermsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue[50],
        centerTitle: true,
        title: Text(
          '利用規約',
          style:TextStyle(
            color:Colors.pink[200],
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          children: <Widget>  [
            Container(
              width: double.infinity,
                height: 3000,
              child: Text(
                  ' Kotono Hack 利用規約 '
                      '\n\n\未定\n',
              ),
            )
          ],
        ),
      ),
    );
  }
}
