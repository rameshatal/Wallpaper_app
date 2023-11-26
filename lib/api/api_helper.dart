import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app_131/api/my_exception.dart';

class ApiHelper {
  Future<dynamic> getApi(
      {required String url, Map<String, String>? mHeader}) async {
    var mData;
   try{
     var res = await http.get(Uri.parse(url),
         headers: mHeader ??
             {
               "Authorization":
               "PfcDSJscGDs056dK4Smv6ngnpXjtnVPylXsqvDSR5sewe8ZPkIs03Se0"
             });
     mData = returnDataResponse(res);
   }on SocketException{
  throw FetchDataException(body: "Internet Error");
   }
   return mData;
  }



  dynamic returnDataResponse(http.Response res) {
    switch (res.statusCode) {
      case 200:
        var mData = res.body;
        print(mData);
        return jsonDecode(mData);

      case 400:throw BadRequestException(body: res.body.toString());
      case 401:
      case 403:
      case 407:throw InvalidInputException(body: res.body.toString());

      case 500:
      default:throw FetchDataException(body: "Error while communicating to server");
    }
  }
}
