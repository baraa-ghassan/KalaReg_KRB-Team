//new
import 'package:http/http.dart';
import 'dart:convert';

class Crud {
  getrequest(String url) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  postrequest(String url, Map data) async {
    // await Future.delayed(const Duration(milliseconds: 1000));
    try {
      var response = await post(Uri.parse(url), body: data);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }
}
