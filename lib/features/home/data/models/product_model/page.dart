import 'package:equatable/equatable.dart';

class Page extends Equatable {
  final int? number;
  final int? size;
  final dynamic prev;
  final int? next;
  final int? last;
  final int? count;

  const Page({
    this.number,
    this.size,
    this.prev,
    this.next,
    this.last,
    this.count,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        number: json['number'] as int?,
        size: json['size'] as int?,
        prev: json['prev'] as dynamic,
        next: json['next'] as int?,
        last: json['last'] as int?,
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'size': size,
        'prev': prev,
        'next': next,
        'last': last,
        'count': count,
      };

  @override
  List<Object?> get props => [number, size, prev, next, last, count];
}
