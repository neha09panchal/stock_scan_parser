import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_scan_parser/response_models/scans_response.dart';

Future<ScanResponseList> fetchScanResponse() async {
  final response = await get(
      Uri.parse('http://coding-assignment.bombayrunning.com/data.json'));

  if (response.statusCode == 200) {
    return ScanResponseList.fromJson(
        jsonDecode(response.body) as List<dynamic>);
  } else {
    throw Exception('Failed to parse the json');
  }
}
