import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/pages/home_tab_page/cart_page.dart';
import 'package:flutter_shop/pages/home_tab_page/category_page.dart';
import 'package:flutter_shop/pages/home_tab_page/home_page.dart';
import 'package:flutter_shop/pages/home_tab_page/member_page.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  var _currenPage;
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员中心'))
  ];
  final List tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];
  @override
  void initState() {
    _currenPage = tabBodies[_currentIndex];
    super.initState();
  }

  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334,allowFontScaling: false);  //屏幕适配
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('App')],
        ),
        elevation: 1.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _currenPage = tabBodies[index];
          });
        },
      ),
      body: _currenPage,
    );
  }
}
