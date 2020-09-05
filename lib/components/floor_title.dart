import 'package:flutter/material.dart';

class FloorTitle extends StatelessWidget {
  final String pic_address;
  const FloorTitle({Key key, this.pic_address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.network(pic_address),
      ),
    );
  }
}