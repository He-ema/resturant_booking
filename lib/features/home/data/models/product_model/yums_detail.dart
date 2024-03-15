import 'package:equatable/equatable.dart';

class YumsDetail extends Equatable {
  final bool? isSuperYums;
  final String? description;

  const YumsDetail({this.isSuperYums, this.description});

  factory YumsDetail.fromJson(Map<String, dynamic> json) => YumsDetail(
        isSuperYums: json['isSuperYums'] as bool?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'isSuperYums': isSuperYums,
        'description': description,
      };

  @override
  List<Object?> get props => [isSuperYums, description];
}
