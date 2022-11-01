import 'package:network_http/servic/emp.dart';

class Emplist {
  String? status;
  String? messege;
  List<Employee>? data;

  Emplist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    if (json['data'] != null) {
      data = <Employee>[];
      json['data'].forEach((x) {
        data!.add(Employee.fromJson(x));
      });
    }
  }

  Map<String, dynamic> tojson() => {
        'status': status,
        'messege': messege,
        'data': List<dynamic>.from(data!.map((x) => x.toJson()))
      };
}
