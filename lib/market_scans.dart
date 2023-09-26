import 'package:flutter/material.dart';
import 'package:stock_scan_parser/response_models/scans_response.dart';
import 'package:stock_scan_parser/scan_criteria.dart';

import 'api.dart';
import 'components/separator.dart';
import 'constants/num_constants.dart';

class MarketScans extends StatefulWidget {
  const MarketScans({super.key});

  @override
  State<MarketScans> createState() => _MarketScansState();
}

class _MarketScansState extends State<MarketScans> {
  late Future<ScanResponseList> scanResponse;

  @override
  void initState() {
    super.initState();
    scanResponse = fetchScanResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        padding16,
      ),
      child: FutureBuilder<ScanResponseList>(
        future: scanResponse,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.fromLTRB(
                padding16,
                padding32,
                padding8,
                padding32,
              ),
              child: ListView.builder(
                itemCount: snapshot.data?.scanResponses?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          final route = MaterialPageRoute(
                            builder: (context) => ScanCriteria(
                              name: snapshot.data?.scanResponses?[index].name,
                              tag: snapshot.data?.scanResponses?[index].tag,
                              textColor:
                                  snapshot.data?.scanResponses?[index].color,
                              criteria:
                                  snapshot.data?.scanResponses?[index].criteria,
                            ),
                          );
                          Navigator.of(context).push(route);
                        },
                        child: ListTile(
                          title: Text(
                            snapshot.data?.scanResponses?[index].name ?? '',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: font20,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data?.scanResponses?[index].tag ?? '',
                            style: TextStyle(
                              fontSize: font15,
                              decoration: TextDecoration.underline,
                              color: ((snapshot.data?.scanResponses?[index]
                                              .color ??
                                          '') ==
                                      'green')
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ),
                      const Separator(),
                    ],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
