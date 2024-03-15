import 'package:equatable/equatable.dart';

class BestOffer extends Equatable {
  final List<int>? tagsIds;
  final String? id;
  final String? name;
  final String? label;

  const BestOffer({this.tagsIds, this.id, this.name, this.label});

  factory BestOffer.fromJson(Map<String, dynamic> json) => BestOffer(
        tagsIds: json['tagsIds'] as List<int>?,
        id: json['id'] as String?,
        name: json['name'] as String?,
        label: json['label'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'tagsIds': tagsIds,
        'id': id,
        'name': name,
        'label': label,
      };

  @override
  List<Object?> get props => [tagsIds, id, name, label];
}
