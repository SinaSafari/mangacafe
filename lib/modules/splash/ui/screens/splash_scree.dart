import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangacafe_v2/modules/splash/data/splash_cubit.dart';
import 'package:mangacafe_v2/modules/splash/data/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashCubit>(context).handleSplash();
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state.destiniationRoute.isNotEmpty) {
            Navigator.of(context).pushReplacementNamed(state.destiniationRoute);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo here

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/images/logo-manga-cafe.png',
                    height: 50,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
