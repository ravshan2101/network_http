import 'package:network_http/servic/emp.dart';

class EmpOne {
  String? status;
  String? messege;
  Employee? data;

  EmpOne.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    data = Employee.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() =>
      {'status': status, 'messege': messege, 'data': data?.toJson()};
}
