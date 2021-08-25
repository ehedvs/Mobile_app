
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Graduate>> fetchGraduates() async {
 var getCode = await FlutterBarcodeScanner.scanBarcode(
      "#009922", "Cancel", true, ScanMode.QR);
  final response = await Future.wait([
    http.get(
        Uri.parse('http://192.168.137.190:8000/graduates/student_api/$getCode')),
    http.get(Uri.parse('http://192.168.137.190:8000/graduates/image_api/$getCode')),
  ]);  Map<String, dynamic> studentData = jsonDecode(response[0].body);
  Map<String, dynamic> imageData =jsonDecode(response[1].body);
  Map<String, dynamic> data = {
    "student": studentData['student'], 
    'full_name': studentData['full_name'],
    'image': imageData['image'],
    'institution': studentData['institution'],
    'school':studentData['school'],
    'dept': studentData['dept'],
    'GPA': studentData['GPA'],
    'CGPA': studentData['CGPA'],
    'date': studentData['date'],

  };

  Graduate graduate = Graduate.fromJson(data);
  List<Graduate> graduates = [];
  graduates.add(graduate);
  return graduates;
}

class Graduate {
  final String student;
  final String fullname;
  final String institution;
  final String thumbnailUrl;
  final String gpa;
  final String cgpa;
  final String school;
  final String dept;
  final String date;

  const Graduate({
    required this.student,
    required this.institution,
    required this.fullname,
    required this.thumbnailUrl,
    required this.cgpa,
    required this.dept,
    required this.gpa,
    required this.school,
    required this.date,
  });

  factory Graduate.fromJson(Map<String, dynamic> json) {
    return Graduate(
      fullname: json['full_name'],
      institution: json['institution'],
      school: json['school'],
      gpa: json['GPA'].toString(),
      cgpa: json['CGPA'].toString(),
      dept: json['dept'],
      date: json['date'].toString(),
      student: json['student'],
      thumbnailUrl: 'http://192.168.137.190:8000' + json['image'],
     
    );
  }
  
  List<Graduate> parseGraduates(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Graduate>((json) => Graduate.fromJson(json)).toList();
  }
}