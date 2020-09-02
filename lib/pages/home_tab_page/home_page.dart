import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'dart:async';
import 'dart:io';
import '../../config/service_url.dart';
import '../../components/banner.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List _bannerListData;
  // List _categoryList;
  Dio dio = new Dio();
  Future fetchDate() async {
    try {
      Response response;
      response = await dio.get(
        servicePath['homeData'],
      );
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: FutureBuilder(
        future: fetchDate(),
        builder: (context, snapshot){
          if (snapshot.hasData) {
            // var data = json.decode(snapshot.data.toString());
            var data = snapshot.data;
            List<Map> bannerList = (data['data']['bannerList'] as List).cast();
            List<Map> cateList = (data['data']['cateList'] as List).cast();
            return Column(
              children: [
                BannerDiy(list: bannerList),
                TopNavgatior(topNavList:cateList)
              ],
            );
          } else{
            return Center(
              child:
              Text('加载中')
            );
          }
        },
      ),
      )
    );
  }
}

 // 首页分类导航
 class TopNavgatior extends StatelessWidget{
  final List topNavList;
  TopNavgatior({Key key,this.topNavList}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: topNavList.map((e){
          return _gridViewItemUI(context, e);
        }).toList()
      ) ,
    );
  }

  @override
  Widget _gridViewItemUI (BuildContext context, item) {
    return InkWell(
      onTap: (){
        print('点击了导航');
      },
      child: Container(
        // padding: EdgeInsets.all(4),
        child: Column(
          children: [
            Image.network(item['img'],width: ScreenUtil().setWidth(95),),
            Text(item['name']),
          ],
      ),
      )
      
    );
  }
}



