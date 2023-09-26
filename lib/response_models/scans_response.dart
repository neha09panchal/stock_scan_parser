class ScanResponseList {
  final List<dynamic>? scanResponses;

  ScanResponseList({this.scanResponses});

  // factory ScanResponseList.fromJson(List<dynamic> json) => ScanResponseList()

  factory ScanResponseList.fromJson(List<dynamic> parsedJson) {
    var scansList = (parsedJson);
    List<ScansResponse> listOfScanResponse =
        scansList.map((i) => ScansResponse.fromJson(i)).toList();

    return ScanResponseList(scanResponses: listOfScanResponse);
  }
}

class ScansResponse {
  final num? id;
  final String? name;
  final String? tag;
  final String? color;
  final List<Criterion> criteria;

  ScansResponse({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory ScansResponse.fromJson(Map<String, dynamic> json) {
    return ScansResponse(
      id: json["id"],
      name: json["name"],
      tag: json["tag"],
      color: json["color"],
      criteria: json["criteria"] == null
          ? []
          : List<Criterion>.from(
              json["criteria"]!.map((x) => Criterion.fromJson(x))),
    );
  }
}

class Criterion {
  final String? type;
  final String? text;
  final Variable? variable;

  Criterion({
    required this.type,
    required this.text,
    required this.variable,
  });

  factory Criterion.fromJson(Map<String, dynamic> json) {
    return Criterion(
      type: json["type"],
      text: json["text"],
      variable:
          json["variable"] == null ? null : Variable.fromJson(json["variable"]),
    );
  }
}

class Variable {
  final The1? the1;
  final The1? the2;
  final The1? the3;
  final The1? the4;

  Variable({
    required this.the1,
    required this.the2,
    required this.the3,
    required this.the4,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      the1: json["\u00241"] == null ? null : The1.fromJson(json["\u00241"]),
      the2: json["\u00242"] == null ? null : The1.fromJson(json["\u00242"]),
      the3: json["\u00243"] == null ? null : The1.fromJson(json["\u00243"]),
      the4: json["\u00244"] == null ? null : The1.fromJson(json["\u00244"]),
    );
  }
}

class The1 {
  final String? type;
  final List<num> values;
  final String? studyType;
  final String? parameterName;
  final num? minValue;
  final num? maxValue;
  final num? defaultValue;

  The1({
    required this.type,
    required this.values,
    required this.studyType,
    required this.parameterName,
    required this.minValue,
    required this.maxValue,
    required this.defaultValue,
  });

  factory The1.fromJson(Map<String, dynamic> json) {
    return The1(
      type: json["type"],
      values: json["values"] == null
          ? []
          : List<num>.from(json["values"]!.map((x) => x)),
      studyType: json["study_type"],
      parameterName: json["parameter_name"],
      minValue: json["min_value"],
      maxValue: json["max_value"],
      defaultValue: json["default_value"],
    );
  }
}
