import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/components/adBanner.dart';
import 'package:flutter_shop/components/floor_content.dart';
import 'package:flutter_shop/components/floor_title.dart';
import 'package:flutter_shop/components/hot_goods.dart';
import 'package:flutter_shop/components/recommend_list.dart';
import 'package:flutter_shop/config/service_url.dart';
import '../../components/banner.dart';
import '../../config/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List<Map> _hotGoodsList = [
    {
      'image': 'http://pic.qianye88.com/4kshipin0c615305-215c-32af-b46b-abcbf890aa9c.jpg?imageMogr2/thumbnail/x300/quality/90!',
      'name': '火爆商品1',
      'mallprice': 79,
      'price': 199
    },
    {
      'image': 'http://pic.qianye88.com/4kshipin0c615305-215c-32af-b46b-abcbf890aa9c.jpg?imageMogr2/thumbnail/x300/quality/90!',
      'name': '火爆商品2',
      'mallprice': 79,
      'price': 199
    }
    ];

  @override
  void initState() {
    super.initState();
    print('home page 挂载');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: request(servicePath['homeData']),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // var data = json.decode(snapshot.data.toString());
            var data = snapshot.data;
            List<Map> bannerList =
                (data['data']['bannerList'] as List).cast(); // banner图
            List<Map> cateList =
                (data['data']['cateList'] as List).cast(); // 分类
            List<Map> recommendList =
                (data['data']['recommendList'] as List).cast(); // 推荐
            String _adPicture =
                data['data']['adPicture'][0]['ad_picture']; // 广告
            Map floor1GoodList = data['data']['floor1GodsList']; //楼层1
            Map floor2GoodList = data['data']['floor2GodsList']; //楼层2
            // List<Map> floor2GoodList = (data['data']['floor2GodsList'] as List).cast(); //楼层2
            return SingleChildScrollView(
              child: Column(
                children: [
                  BannerDiy(list: bannerList),
                  TopNavgatior(topNavList: cateList),
                  AdBanner(ad_picture: _adPicture),
                  Recommend(recommendList: recommendList),
                  FloorTitle(pic_address: floor1GoodList['floor1Title']),
                  FloorContent(floorGoodList: floor1GoodList['goodsList']),
                  FloorTitle(pic_address: floor2GoodList['floor2Title']),
                  FloorContent(floorGoodList: floor2GoodList['goodsList']),
                  HotGoods(_hotGoodsList),  //火爆商品
                  // LauncherPhone(bossImg: _bossImg, bossPhone: _bossPhone,)
                ],
              ),
            );
          } else {
            return Center(child: Text('加载中...'));
          }
        },
      ),
    ));
  }
}

// 首页分类导航
class TopNavgatior extends StatelessWidget {
  final List topNavList;
  TopNavgatior({Key key, this.topNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 只显示5个分类
    if (topNavList.length > 6) {
      topNavList.removeRange(6, topNavList.length);
    }
    return Container(
        height: ScreenUtil().setHeight(167),
        // height: 167.h,
        padding: EdgeInsets.all(4),
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 1,
          padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
          children: List.of(topNavList.map((e) {
            return _gridViewItemUI(context, e);
          })),
          // toList() 方法等同于 List.of()
          // children: topNavList.map((e) {
          //   return _gridViewItemUI(context, e);
          // }).toList()),
        ));
  }

  @override
  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
        onTap: () {
          print('点击了导航');
        },
        child: Container(
          padding: EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Image.network(
                item['img'],
                width: ScreenUtil().setWidth(95),
              ),
              Text(item['name']),
            ],
          ),
        ));
  }
}

// 火爆商品,上啦加载商品
/*class HotGoods extends StatefulWidget {
  @override
  _HotGoodsState createState() => _HotGoodsState();
}

class _HotGoodsState extends State<HotGoods> {
  int page = 1; //上拉加载页数
  List<Map> hotGoodsList = [
    {
      'image': 'https://static.fotor.com.cn/assets/projects/pages/9d2b10d0-3e28-11e9-97b1-e596af35066e_baebbe08-72ee-456f-91b4-d46723e1703e_thumb.jpg',
      'name': '火爆商品1',
      'mallprice': 79,
      'price': 199
    },
    {
      'image': 'https://static.fotor.com.cn/assets/projects/pages/9d2b10d0-3e28-11e9-97b1-e596af35066e_baebbe08-72ee-456f-91b4-d46723e1703e_thumb.jpg',
      'name': '火爆商品2',
      'mallprice': 79,
      'price': 199
    }
    ]; // 上拉加载数据list
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _hotGoods(),
    );
  }

  // 火爆专区 title
  Widget HotGoodsTitle = Container(
    margin: EdgeInsets.all(4),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black38),
        )),
    child: Text('火爆专区'),
  );

// 火爆专区子项
  Widget _hotGoodsWrapList() {
    if (hotGoodsList.length > 0) {
      List<Widget> listWidget = List.of(hotGoodsList.map((e) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(4),
            color: Colors.white,
            child: Column(
              children: [
                Image.network(
                  e['image'],
                  width: ScreenUtil().setWidth(375),
                ),
                Text(
                  e['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.green[200],
                      fontSize: ScreenUtil().setSp(20)),
                ),
                Row(
                  children: [
                    Text('¥${e["mallprice"]}'),
                    Text(
                      '¥${e["price"]}',
                      style: TextStyle(
                          color: Colors.black38,
                          decoration: TextDecoration.lineThrough),
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
*/
