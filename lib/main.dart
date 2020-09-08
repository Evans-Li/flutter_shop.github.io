import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/pages/IndexPage.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/provide/counter.dart';

void main(){
  var counter =Counter();
  var providers  =Providers();
  providers
    ..provide(Provider<Counter>.value(counter));

  runApp(
    ProviderNode(
      child: MyApp(),
      providers: providers,
    )
  );
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

