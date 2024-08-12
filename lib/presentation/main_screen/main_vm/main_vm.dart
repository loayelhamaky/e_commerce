import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'main_state.dart';

@injectable
class MainVm extends Cubit<MainState> {
  MainVm() : super(MainState());

  void setSelectedTab(int tappedIndex) {
    emit(state.copyWith(currentSelectedTab: tappedIndex));
  }
}
