import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String? photoUrl;

  UserModel({required this.id, required this.name, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      photoUrl: map['photoUrl'],
    );
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "photoUrl": photoUrl,
      };

  String toJson() => jsonEncode(toMap());
}
