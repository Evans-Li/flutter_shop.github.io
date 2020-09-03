import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Recommend extends StatelessWidget {
  final List recommendList;
  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(260.0),
      // width: ScreenUtil().setWidth(750.0),
      margin: EdgeInsets.only(top:10.0),
      child: Column(
        children: [
          _titleWidget(),
          _recommendList()
        ],
      ),
    );
  }

  Widget _recommendList(){
    return Expanded(
      // width: ScreenUtil().setWidth(750.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, int index){
          return _itemWidget(index);
        },
      ),
    );
  }
  Widget _itemWidget(index){
    return Container(
      width: ScreenUtil().setWidth(250.0),
      height: ScreenUtil().setHeight(230.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Colors.black12, width: 1)
        )
      ),
      child: InkWell(
        onTap: (){},
        child: Column(
          children: [
            Image.network(
              recommendList[index]['img'],
              ),
            Text('¥${recommendList[index]["mall_price"]}'),
            Text(
              '¥${recommendList[index]["price"]}',
              style: TextStyle(
                color: Colors.black12,
                decoration: TextDecoration.lineThrough
              ),
            )
          ],
        ),
      ),
    );
  }

  // 推荐商品title组件
  Widget _titleWidget(){
    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.green[200],
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.green[200])
        )
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.black),
      ),
    ); 
  }

}