import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial());

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(const MainState.initial());
  }
}
