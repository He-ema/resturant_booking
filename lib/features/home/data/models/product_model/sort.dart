import 'package:equatable/equatable.dart';

class Sort extends Equatable {
  final String? label;
  final dynamic version;
  final bool? selected;

  const Sort({this.label, this.version, this.selected});

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        label: json['label'] as String?,
        version: json['version'] as dynamic,
        selected: json['selected'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'version': version,
        'selected': selected,
      };

  @override
  List<Object?> get props => [label, version, selected];
}
