import 'dart:io';

import 'package:dio/dio.dart';

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded');
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      return response;
    } else {
      return response;
    }
  } catch (e) {
    return print('error:::${e}');
  }
}
