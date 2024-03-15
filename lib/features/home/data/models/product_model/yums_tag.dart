import 'package:equatable/equatable.dart';

class YumsTag extends Equatable {
  final int? id;
  final int? categoryId;
  final String? name;

  const YumsTag({this.id, this.categoryId, this.name});

  factory YumsTag.fromJson(Map<String, dynamic> json) => YumsTag(
        id: json['id'] as int?,
        categoryId: json['categoryId'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'categoryId': categoryId,
        'name': name,
      };

  @override
  List<Object?> get props => [id, categoryId, name];
}
