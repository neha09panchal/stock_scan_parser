import 'dart:convert';

import 'package:http/http.dart';
import 'package:stock_scan_parser/response_models/scans_response.dart';

Future<ScanResponseList> fetchScanResponse() async {
  final response = await get(
      Uri.parse('http://coding-assignment.bombayrunning.com/data.json'));

  if (response.statusCode == 200) {
    // try {
    List jsonResponse = json.decode(response.body);
    print(
        '*** ${ScanResponseList.fromJson(jsonDecode(response.body) as List<dynamic>)}');
    return ScanResponseList.fromJson(
        jsonDecode(response.body) as List<dynamic>);
    // return jsonResponse.map((e) => ScanResponseList.fromJson(e)).toList();
    // return ScanResponseList.fromJson(jsonDecode(response.body));
    // } catch (e, s) {
    //   print('**error: $e, **stack : $s');
    // return ScanResponseList.fromJson(json.decode(response.body));
    // List jsonResponse = json.decode(response.body);
    // return jsonResponse.map((job) => new ProductList.fromJson(job)).toList();
    // }
  } else {
    throw Exception('Failed to parse the json');
  }
}
