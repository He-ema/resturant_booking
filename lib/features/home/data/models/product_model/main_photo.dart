import 'package:equatable/equatable.dart';

class MainPhoto extends Equatable {
  final String? source;

  const MainPhoto({
    this.source,
  });

  factory MainPhoto.fromJson(Map<String, dynamic> json) => MainPhoto(
        source: json['source'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'source': source,
      };

  @override
  List<Object?> get props {
    return [
      source,
    ];
  }
}
