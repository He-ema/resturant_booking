part of 'booked_resturant_cubit.dart';

sealed class BookedResturantState extends Equatable {
  const BookedResturantState();

  @override
  List<Object> get props => [];
}

final class BookedResturantInitial extends BookedResturantState {}

final class BookedResturantLoading extends BookedResturantState {}

final class BookedResturantSuccess extends BookedResturantState {
  final List<BookedResturantModel> bookedResturantList;
  const BookedResturantSuccess(this.bookedResturantList);
}

final class BookedResturantFailure extends BookedResturantState {
  final String errorMessage;
  const BookedResturantFailure(this.errorMessage);
}
