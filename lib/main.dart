import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/pages/IndexPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '百姓生活',
        theme: ThemeData(
          primaryColor: Colors.greenAccent
        ),
        home: IndexPage(),
        
      ),
    );
  }
}

