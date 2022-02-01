import 'package:flutter/material.dart';

@immutable
class SplashState {
  final bool isLoading;
  final bool isFirst;
  final String? errorMessage;
  final String destiniationRoute;

  const SplashState(
    this.isLoading,
    this.isFirst,
    this.errorMessage,
    this.destiniationRoute,
  );

  factory SplashState.initialState() {
    return const SplashState(true, true, null, "");
  }

  SplashState copyWith({
    bool? isLoading,
    bool? isFirst,
    String? errorMessage,
    String? destiniationRoute,
    bool clearError = false,
  }) {
    return SplashState(
      isLoading ?? this.isLoading,
      isFirst ?? this.isFirst,
      clearError ? null : errorMessage ?? this.errorMessage,
      destiniationRoute ?? this.destiniationRoute,
    );
  }

  @override
  int get hashCode =>
      hashValues(isLoading, isFirst, errorMessage, destiniationRoute);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SplashState &&
            isLoading == other.isLoading &&
            errorMessage == other.errorMessage &&
            destiniationRoute == other.destiniationRoute &&
            isFirst == other.isFirst);
  }
}
