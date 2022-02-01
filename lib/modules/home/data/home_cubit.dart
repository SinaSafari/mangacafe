import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangacafe_v2/modules/home/data/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initialState());

  setCurrentTab(String newTab) {
    emit(state.copyWith(currentTab: newTab));
  }

  setCurrentTabIndex(int newIndex) {
    emit(state.copyWith(currentTabIndex: newIndex));
  }
}
