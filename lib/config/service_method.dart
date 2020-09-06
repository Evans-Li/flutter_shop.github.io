import 'dart:async';
import 'package:dio/dio.dart';

Future request(url, {dataForm}) async {
  Dio dio = new Dio();
  try {
    Response response;
    print('开始获取数据$url');
    if (dataForm == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url,data:dataForm);
    }
    if(response.statusCode == 200){
        return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    print('Error===============$e');
  }
}

