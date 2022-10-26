import 'dart:convert';

import 'package:http/http.dart';
import 'package:network_http/model/post.dart';

class Network {
  // domen
  static String Base = 'dummy.restapiexample.com';
// api
  static String Api_list = '/api/v1/employee/1';
  static String Api_create = '/api/v1/create';
  static String Api_updata = '/api/v1/update/21';
  static String Api_delete = '/api/v1/delete/2';

// http request
  static Future<String?> GET(String api, Map<String, String> parms) async {
    var uri = Uri.https(Base, api, parms);
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(
      Base,
      api,
    );
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(Base, api);
    var response = await put(uri, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(Base, api, params);
    var response = await delete(uri);

    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // http params

  static Map<String, String> paramsNotempty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'name': post.name!,
      'salary': post.salary!,
      'age': post.age!,
      'id': post.id!
    });
    return params;
  }

  static Map<String, String> paramsUpdata(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'name': post.name!,
      'salary': post.salary!,
      'age': post.age!,
      'id': post.id!
    });
    return params;
  }
}
