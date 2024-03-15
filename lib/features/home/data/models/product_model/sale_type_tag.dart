import 'package:equatable/equatable.dart';

class SaleTypeTag extends Equatable {
  final int? id;
  final String? name;
  final String? slug;
  final bool? indexable;

  const SaleTypeTag({this.id, this.name, this.slug, this.indexable});

  factory SaleTypeTag.fromJson(Map<String, dynamic> json) => SaleTypeTag(
        id: json['id'] as int?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        indexable: json['indexable'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'indexable': indexable,
      };

  @override
  List<Object?> get props => [id, name, slug, indexable];
}
