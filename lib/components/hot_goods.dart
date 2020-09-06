import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';


// 火爆商品,上啦加载商品
class HotGoods extends StatefulWidget {
  List<Map> hotGoodList=[];
  HotGoods(this.hotGoodList,{Key key, }) : super(key: key);
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  @override
  int page = 1; //上拉加载页数
  // List<Map> hotGoodsList = []
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _hotGoods(),
    );
  }

  // 火爆专区 title
  Widget HotGoodsTitle = Container(
    margin: EdgeInsets.fromLTRB(2,30,2,10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black38),
        )),
    child: Text('火爆专区', style: TextStyle(fontSize: ScreenUtil().setSp(30))),
  );

// 火爆专区子项
  Widget _hotGoodsWrapList() {
    if (widget.hotGoodList.length > 0) {
      List<Widget> listWidget = List.of(widget.hotGoodList.map((e) {
        return InkWell(
          onTap: () {print('点击了火爆商品');},
          child: Container(
            width: ScreenUtil().setWidth(355),
            // padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(4),
            color: Colors.white,
            child: Column(
              children: [
                Image.network(
                  e['image'],
                  width: ScreenUtil().setWidth(355),
                ),
                Text(
                  e['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: ScreenUtil().setSp(20)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text('¥${e["mallprice"]}',textAlign: TextAlign.center,),
                    ),
                    Expanded(
                      child: Text(
                      '¥${e["price"]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black38,
                          decoration: TextDecoration.lineThrough),
                    ),
                    )
                    
                  ],
                )
              ],
            ),
          ),
        );
      }));
      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('没有商品');
    }
  }

  Widget _hotGoods (){
    return Container(
      child: Column(
        children: [
          HotGoodsTitle,
          _hotGoodsWrapList()
        ],
      ),
    );
  }
}
