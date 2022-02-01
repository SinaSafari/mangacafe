import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangacafe_v2/modules/splash/data/splash_state.dart';
import 'package:mangacafe_v2/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initialState());

  Future<void> handleSplash() async {
    emit(state.copyWith(isLoading: true));

    try {
      await Future.delayed(const Duration(seconds: 2));

      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool wasHereBefor = prefs.getBool('is_first') ?? false;

      if (wasHereBefor) {
        // go to home page
        emit(state.copyWith(
          isLoading: false,
          destiniationRoute: AppRouter.homeScreen,
        ));
      } else {
        await prefs.setBool('is_first', true);
        // go to intro page
        emit(state.copyWith(
          isLoading: false,
          destiniationRoute: AppRouter.introScreen,
        ));
      }
    } catch (e) {
      //
    }
  }
}
