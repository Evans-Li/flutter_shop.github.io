import 'package:flutter/material.dart';


class AdBanner extends StatelessWidget {
  final  ad_picture;
  AdBanner({Key key, this.ad_picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Image.network('$ad_picture'),
    );
  }
}