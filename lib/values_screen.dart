import 'package:flutter/material.dart';
import 'package:stock_scan_parser/response_models/scans_response.dart';

import 'components/separator.dart';
import 'constants/num_constants.dart';

class ValuesScreen extends StatelessWidget {
  final The1? criteriaObject;

  const ValuesScreen({
    super.key,
    required this.criteriaObject,
  });

  @override
  Widget build(BuildContext context) {
    var numbers = criteriaObject?.values;
    numbers?.sort();

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: padding50,
            left: padding16,
            right: padding16,
          ),
          child: Column(
            children: [
              if (criteriaObject?.type == 'indicator') ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      criteriaObject?.studyType?.toUpperCase() ?? '',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: font20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: padding16,
                    ),
                    Text(
                      'Set Parameters',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: font20,
                      ),
                    ),
                    SizedBox(
                      height: padding16,
                    ),
                    Container(
                      color: Colors.white,
                      height: padding150,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: padding16,
                          right: padding16,
                          top: padding16,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (criteriaObject!.parameterName!.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.only(
                                  top: padding8,
                                ),
                                child: Text(
                                  (criteriaObject!.parameterName![0]
                                          .toUpperCase() +
                                      criteriaObject!.parameterName!
                                          .substring(1)),
                                  style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                    fontSize: font20,
                                  ),
                                ),
                              ),
                            SizedBox(
                              width: padding200,
                              child: TextField(
                                controller: TextEditingController()
                                  ..text =
                                      criteriaObject?.defaultValue.toString() ??
                                          '',
                                style: TextStyle(
                                    fontSize: font20, color: Colors.black),
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: padding0,
                                    vertical: padding0,
                                  ),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ] else ...[
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: criteriaObject?.values.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: padding16),
                            child: Text(
                              numbers?[index].toString() ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: font20,
                              ),
                            ),
                          ),
                          const Separator(),
                        ],
                      );
                    })
              ]
            ],
          ),
        ),
      ),
    );
  }
}
