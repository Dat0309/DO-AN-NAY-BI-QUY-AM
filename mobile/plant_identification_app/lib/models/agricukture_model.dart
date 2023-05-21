// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Agriculture {
  final String? id;
  final String? specificName;
  final String? commonName;
  final String? image;
  final String? description;
  final String? type;
  final String? heightAndSpread;
  final String? family;
  Agriculture({
    this.id,
    this.specificName,
    this.commonName,
    this.image,
    this.description,
    this.type,
    this.heightAndSpread,
    this.family,
  });
  


  Agriculture copyWith({
    String? id,
    String? specificName,
    String? commonName,
    String? image,
    String? description,
    String? type,
    String? heightAndSpread,
    String? family,
  }) {
    return Agriculture(
      id: id ?? this.id,
      specificName: specificName ?? this.specificName,
      commonName: commonName ?? this.commonName,
      image: image ?? this.image,
      description: description ?? this.description,
      type: type ?? this.type,
      heightAndSpread: heightAndSpread ?? this.heightAndSpread,
      family: family ?? this.family,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'specific_name': specificName,
      'common_name': commonName,
      'image': image,
      'description': description,
      'type': type,
      'height_and_spread': heightAndSpread,
      'family': family,
    };
  }

  factory Agriculture.fromMap(Map<String, dynamic> map) {
    return Agriculture(
      id: map['_id'] != null ? map['_id'] as String : null,
      specificName: map['specific_name'] != null ? map['specific_name'] as String : null,
      commonName: map['common_name'] != null ? map['common_name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      heightAndSpread: map['height_and_spread'] != null ? map['height_and_spread'] as String : null,
      family: map['family'] != null ? map['family'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Agriculture.fromJson(String source) => Agriculture.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Agriculture(id: $id, specificName: $specificName, commonName: $commonName, image: $image, description: $description, type: $type, heightAndSpread: $heightAndSpread, family: $family)';
  }

  @override
  bool operator ==(covariant Agriculture other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.specificName == specificName &&
      other.commonName == commonName &&
      other.image == image &&
      other.description == description &&
      other.type == type &&
      other.heightAndSpread == heightAndSpread &&
      other.family == family;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      specificName.hashCode ^
      commonName.hashCode ^
      image.hashCode ^
      description.hashCode ^
      type.hashCode ^
      heightAndSpread.hashCode ^
      family.hashCode;
  }
}
