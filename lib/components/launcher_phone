import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherPhone extends StatelessWidget {
  final String bossPhone;
  final String bossImg;
  LauncherPhone({Key key, this.bossImg,this.bossPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launcherURL,
        child: Image.network('$bossPhone'),
      ),
    );
  }

  void _launcherURL() async{
    String url = 'tel:'+bossPhone;
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}