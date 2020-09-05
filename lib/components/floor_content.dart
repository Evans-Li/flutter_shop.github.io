import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class FloorContent extends StatelessWidget {
  final List floorGoodList;
  const FloorContent({Key key, this.floorGoodList}) : super(key: key);

  // 不规则楼层
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _firstRow(),
          _otherGoods()
        ],
      ),
    );
  }

  // 楼层上半部分
  Widget _firstRow(){
    return Container(
      child: Row(
        children: [
          _itemGoods(floorGoodList[0]),
          Column(
            children: [
              _itemGoods(floorGoodList[1]),
              _itemGoods(floorGoodList[2])
            ],
          )
        ],
      ),
    );
  }

  // 楼层下半部

  Widget _otherGoods(){
    return Row(
      children: [
        _itemGoods(floorGoodList[3]),
        _itemGoods(floorGoodList[4])
      ],
    );
  }

 // 单个楼层商品
Widget _itemGoods(Map good){
  return Container(
    width: ScreenUtil().setWidth(375),
    child: InkWell(
      onTap: (){print('点击了楼层商品');},
      child: Image.network(good['goods_img']),
    ),
  );
}
  
}

