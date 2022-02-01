import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangacafe_v2/modules/home/data/home_cubit.dart';
import 'package:mangacafe_v2/modules/home/data/home_state.dart';
import 'package:mangacafe_v2/modules/home/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final int currentTabIndex = state.currentTabIndex;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red[700],
            title: const Text(HomeConstants.appBarTitle),
            elevation: 0,
          ),
          body: HomeState.tabsArr[currentTabIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: HomeConstants.homeTabLabel,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted_outlined),
                label: HomeConstants.collectionsTabLabel,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: HomeConstants.storeTabLabel,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: HomeConstants.profileTabLabel,
              ),
            ],
            type: BottomNavigationBarType.fixed,
            currentIndex: state.currentTabIndex,
            selectedItemColor: Colors.red[500],
            onTap: (int index) {
              BlocProvider.of<HomeCubit>(context).setCurrentTabIndex(index);
            },
          ),
        );
      },
    );
  }
}
