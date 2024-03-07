import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_sheet_state.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetInitial());

  int currentSheetIndex = 0;

  set changeCurrentIndex(int newIndex) {
    currentSheetIndex = newIndex;

    emit(BottomSheetSuccess());
  }

  int get getCurrentIndex {
    return currentSheetIndex;
  }
}
