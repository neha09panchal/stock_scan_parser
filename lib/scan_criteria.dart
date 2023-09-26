import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_parser/response_models/scans_response.dart';
import 'package:stock_scan_parser/values_screen.dart';

import 'constants/num_constants.dart';

class ScanCriteria extends StatelessWidget {
  final String name;
  final String tag;
  final String textColor;
  final List<Criterion> criteria;

  const ScanCriteria({
    super.key,
    required this.name,
    required this.tag,
    required this.textColor,
    required this.criteria,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: padding16,
            right: padding16,
            top: padding30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: height170,
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    padding16,
                    padding16,
                    padding16,
                    padding8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: font24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        tag,
                        style: TextStyle(
                          color: (textColor == 'green')
                              ? Colors.green
                              : Colors.red,
                          fontSize: font20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: padding16),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: criteria.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (criteria[index].type == 'plain_text')
                          Text(
                            criteria[index].text ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: font20,
                            ),
                          ),
                        if (criteria[index].type == 'variable')
                          displayValues(
                            criteria[index].text ?? '',
                            criteria[index].variable!,
                            context,
                          ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: padding16,
                      ),
                      child: Text(
                        'and',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: font15,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List getStrings(String criteriaText) {
  List<String> criterionText = <String>[];

  int i = 0, j = 0;

  for (i = 0; i < criteriaText.length; i++) {
    if (criteriaText[i] == '\$') {
      criterionText.add(criteriaText.substring(j, i));

      j = i + 2;

      criterionText.add(criteriaText.substring(i, j));
    }
  }

  criterionText.add(criteriaText.substring(j, i));

  return criterionText;
}

Widget displayValues(
    String criteriaText, Variable variable, BuildContext context) {
  List criteriaTextTemp = getStrings(criteriaText);

  final textSpanStr = <TextSpan>[];
  The1? criteriaListValue;

  for (var element in criteriaTextTemp) {
    if (element == '\$1') {
      textSpanStr.add(
        TextSpan(
          text: variable.the1?.type == 'indicator'
              ? '(${variable.the1?.defaultValue})'
              : '(${variable.the1?.values[0]})',
          style: TextStyle(
            color: Colors.purple,
            fontSize: font20,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              criteriaListValue = variable.the1;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ValuesScreen(
                    criteriaObject: criteriaListValue,
                  ),
                ),
              );
            },
        ),
      );
    } else if (element == '\$2') {
      textSpanStr.add(
        TextSpan(
          text: variable.the2?.type == 'indicator'
              ? '(${variable.the2?.defaultValue})'
              : '(${variable.the2?.values[0]})',
          style: TextStyle(
            color: Colors.purple,
            fontSize: font20,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              criteriaListValue = variable.the2;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ValuesScreen(
                    criteriaObject: criteriaListValue,
                  ),
                ),
              );
            },
        ),
      );
    } else if (element == '\$3') {
      textSpanStr.add(
        TextSpan(
          text: variable.the3?.type == 'indicator'
              ? '(${variable.the3?.defaultValue})'
              : '(${variable.the3?.values[0]})',
          style: TextStyle(
            color: Colors.purple,
            fontSize: font20,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              criteriaListValue = variable.the3;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ValuesScreen(
                    criteriaObject: criteriaListValue,
                  ),
                ),
              );
            },
        ),
      );
    } else if (element == '\$4') {
      textSpanStr.add(
        TextSpan(
          text: variable.the4?.type == 'indicator'
              ? '(${variable.the4?.defaultValue})'
              : '(${variable.the4?.values[0]})',
          style: TextStyle(
            color: Colors.purple,
            fontSize: font20,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              criteriaListValue = variable.the4;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ValuesScreen(
                    criteriaObject: criteriaListValue,
                  ),
                ),
              );
            },
        ),
      );
    } else {
      textSpanStr.add(
        TextSpan(
            text: element,
            style: TextStyle(
              fontSize: font20,
            )),
      );
    }
  }

  return RichText(
    text: TextSpan(
      children: textSpanStr,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
