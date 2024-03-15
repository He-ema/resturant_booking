import 'package:equatable/equatable.dart';

class MarketingOffer extends Equatable {
  final String? title;
  final String? type;

  const MarketingOffer({this.title, this.type});

  factory MarketingOffer.fromJson(Map<String, dynamic> json) {
    return MarketingOffer(
      title: json['title'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'type': type,
      };

  @override
  List<Object?> get props => [title, type];
}
