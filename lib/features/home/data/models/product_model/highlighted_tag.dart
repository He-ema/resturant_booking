import 'package:equatable/equatable.dart';

class HighlightedTag extends Equatable {
  final String? id;
  final String? slug;
  final bool? indexable;
  final String? text;
  final String? type;

  const HighlightedTag({
    this.id,
    this.slug,
    this.indexable,
    this.text,
    this.type,
  });

  factory HighlightedTag.fromJson(Map<String, dynamic> json) {
    return HighlightedTag(
      id: json['id'] as String?,
      slug: json['slug'] as String?,
      indexable: json['indexable'] as bool?,
      text: json['text'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'indexable': indexable,
        'text': text,
        'type': type,
      };

  @override
  List<Object?> get props => [id, slug, indexable, text, type];
}
