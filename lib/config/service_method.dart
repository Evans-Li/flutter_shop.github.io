import 'dart:async';
import 'package:dio/dio.dart';
import '../config//service_url.dart';

Future request(url, {dataForm}) async {
  Dio dio = new Dio();
  try {
    Response response;
    if (dataForm == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url,data:dataForm);
    }
    return response.data;
  } catch (e) {
    print(e);
  }
}

