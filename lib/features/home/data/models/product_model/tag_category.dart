import 'package:equatable/equatable.dart';

import 'tag.dart';

class TagCategory extends Equatable {
  final List<Tag>? tags;
  final int? id;
  final String? name;

  const TagCategory({this.tags, this.id, this.name});

  factory TagCategory.fromJson(Map<String, dynamic> json) => TagCategory(
        tags: (json['tags'] as List<dynamic>?)
            ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
            .toList(),
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tags': tags?.map((e) => e.toJson()).toList(),
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [tags, id, name];
}
