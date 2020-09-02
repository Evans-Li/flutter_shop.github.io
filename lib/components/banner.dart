import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class BannerDiy extends StatefulWidget {
  final List list;
  final height;
  BannerDiy({
      Key key,
      @required this.list,  // 必传参数
      this.height=300.0
    }) : super(key: key);

  @override
  _BannerDiyState createState() => _BannerDiyState();
}

class _BannerDiyState extends State<BannerDiy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: widget.height,
      child: AspectRatio(
        aspectRatio: 16.0/9.0,
        child: Swiper(
          itemBuilder: (BuildContext context, int index){
            return Image.network(
              '${widget.list[index]["img"]}',
              fit: BoxFit.cover,
              );
          },
          itemCount: widget.list.length,
          pagination: SwiperPagination(),
          control: SwiperControl(),
          autoplay: true,
        ),
      )
      
    );
  }
}