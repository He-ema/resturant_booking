import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:jobizz/constants.dart';
import 'package:jobizz/features/booking_history/data/models/booked_resturant_model.dart';

part 'booked_resturant_state.dart';

class BookedResturantCubit extends Cubit<BookedResturantState> {
  BookedResturantCubit() : super(BookedResturantInitial());

  Future<void> getBookedResturants() async {
    emit(BookedResturantLoading());
    CollectionReference bookedResturants =
        FirebaseFirestore.instance.collection(kBookCollectionReference);

    List<BookedResturantModel> bookedResturantList = [];
    try {
      await bookedResturants.get().then((value) {
        for (var element in value.docs) {
          bookedResturantList
              .add(BookedResturantModel.fromJson(element.data()));
        }
      });
      emit(BookedResturantSuccess(bookedResturantList));
    } catch (e) {
      emit(BookedResturantFailure(e.toString()));
    }
  }
}
