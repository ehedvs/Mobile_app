import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Graduate>> fetchGraduates() async {
  var getCode = await FlutterBarcodeScanner.scanBarcode(
      "#009922", "Cancel", true, ScanMode.QR);
  final response = await Future.wait([
    http.get(
        Uri.parse('http://192.168.43.247:8000/graduates/student_api/$getCode')),
    http.get(
        Uri.parse('http://192.168.43.247:8000/graduates/image_api/$getCode'))
  ]);
  Map<String, dynamic> studentData = jsonDecode(response[0].body);
  Map<String, dynamic> imageData = jsonDecode(response[1].body);
  Map<String, dynamic> data = {
    'id': studentData['id'],
    'first_name': studentData['first_name'],
    'middle_name': studentData['middle_name'],
    'last_name': studentData['last_name'],
    'image': imageData['image'],
    'inst_name': studentData['inst_name'],
  };

  Graduate graduate = Graduate.fromJson(data);
  List<Graduate> graduates = [];
  graduates.add(graduate);
  return graduates;
}

class Graduate {
  final String id;
  final String firstname;
  final String lastname;
  final String instname;
  final String middlename;
  final String thumbnailUrl;

  const Graduate({
    required this.id,
    required this.middlename,
    required this.instname,
    required this.firstname,
    required this.lastname,
    required this.thumbnailUrl,
  });

  factory Graduate.fromJson(Map<String, dynamic> json) {
    return Graduate(
      id: json['id'],
      firstname: json['first_name'],
      lastname: json['last_name'],
      instname: json['inst_name'],
      middlename: json['middle_name'],
      thumbnailUrl: 'http://192.168.43.247:8000' + json['image'],
    );
  }

  List<Graduate> parseGraduates(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Graduate>((json) => Graduate.fromJson(json)).toList();
  }
}
