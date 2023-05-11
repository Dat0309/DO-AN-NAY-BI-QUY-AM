import 'dart:convert';

class AgricultureRecognition {
  String? common_name;

  AgricultureRecognition({this.common_name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'common_name': common_name};
  }

  factory AgricultureRecognition.fromMap(Map<String, dynamic> map) {
    return AgricultureRecognition(
        common_name:
            map['common_name'] != null ? map['common_name'] as String : null);
  }

  String toJson() => json.encode(toMap());

  factory AgricultureRecognition.fromJson(String source) =>
      AgricultureRecognition.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
