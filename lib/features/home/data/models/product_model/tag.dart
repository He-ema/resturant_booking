import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final int? id;
  final String? type;
  final int? count;
  final String? name;

  const Tag({this.id, this.type, this.count, this.name});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json['id'] as int?,
        type: json['type'] as String?,
        count: json['count'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'count': count,
        'name': name,
      };

  @override
  List<Object?> get props => [id, type, count, name];
}
