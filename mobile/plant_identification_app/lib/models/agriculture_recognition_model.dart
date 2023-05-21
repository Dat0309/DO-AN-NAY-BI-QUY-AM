// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AgricultureRecognition {
  final String? key;
  final String? common_name;
  final double? percent;
  AgricultureRecognition({
    this.key,
    this.common_name,
    this.percent,
  });
 

  AgricultureRecognition copyWith({
    String? key,
    String? common_name,
    double? percent,
  }) {
    return AgricultureRecognition(
      key: key ?? this.key,
      common_name: common_name ?? this.common_name,
      percent: percent ?? this.percent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'common_name': common_name,
      'percent': percent,
    };
  }

  factory AgricultureRecognition.fromMap(Map<String, dynamic> map) {
    return AgricultureRecognition(
      key: map['key'] != null ? map['key'] as String : null,
      common_name: map['common_name'] != null ? map['common_name'] as String : null,
      percent: map['percent'] != null ? map['percent'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AgricultureRecognition.fromJson(String source) => AgricultureRecognition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AgricultureRecognition(key: $key, common_name: $common_name, percent: $percent)';

  @override
  bool operator ==(covariant AgricultureRecognition other) {
    if (identical(this, other)) return true;
  
    return 
      other.key == key &&
      other.common_name == common_name &&
      other.percent == percent;
  }

  @override
  int get hashCode => key.hashCode ^ common_name.hashCode ^ percent.hashCode;
}
