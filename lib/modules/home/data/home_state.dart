import 'package:flutter/material.dart';
import 'package:mangacafe_v2/modules/home/ui/widgets/collections_tab.dart';
import 'package:mangacafe_v2/modules/home/ui/widgets/home_tab.dart';
import 'package:mangacafe_v2/modules/home/ui/widgets/profile_tab.dart';
import 'package:mangacafe_v2/modules/home/ui/widgets/store_tab.dart';

@immutable
class HomeState {
  final bool isLoading;
  final String? errorMessage;
  final int currentTabIndex;

  static List<Widget> tabsArr = [
    HomeTab(),
    const CollectionsTab(),
    const StoreTab(),
    const ProfileTab(),
  ];

  const HomeState(
    this.isLoading,
    this.errorMessage,
    this.currentTabIndex,
  );

  factory HomeState.initialState() {
    return const HomeState(true, null, 0);
  }

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? currentTab,
    int? currentTabIndex,
    bool clearError = false,
  }) {
    return HomeState(
      isLoading ?? this.isLoading,
      clearError ? null : errorMessage ?? this.errorMessage,
      currentTabIndex ?? this.currentTabIndex,
    );
  }

  @override
  int get hashCode => hashValues(isLoading, errorMessage, currentTabIndex);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is HomeState &&
            isLoading == other.isLoading &&
            currentTabIndex == other.currentTabIndex &&
            errorMessage == other.errorMessage);
  }
}
