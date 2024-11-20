import 'package:bloc/bloc.dart';

class BottombarCubit extends Cubit<int> {
  BottombarCubit() : super(0);

  void change(int index) {
    emit(index);
  }
}
