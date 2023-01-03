import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  int id;
  int? parentId;
  String name;

  Item({
    required this.id,
    required this.parentId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'parentId': parentId,
      'name': name,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      parentId: map['parentId'] != null ? map['parentId'] as int : null,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);
}
