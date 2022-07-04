import 'package:bmi_calculator/viewmodel/base/failures.dart';
import 'package:flutter/material.dart';

abstract class ViewModelBase extends ChangeNotifier {
  ViewState _state = EmptyState();

  Failure? failure;

  Future<void> setViewState(ViewState state) {
    _state = state;
    notifyListeners();
    return Future.value();
  }

  ViewState get state => _state;

  Future<void> init() {
    return Future.value();
  }

  Future<void> teardown() {
    return Future.value();
  }
}

abstract class ViewState {}

class EmptyState extends ViewState {}

class LoadingState extends ViewState {}

class LoadedState extends ViewState {}

class WaitingState extends ViewState {}

class ErrorState<T extends Failure> extends ViewState {
  final T failure;

  ErrorState(this.failure);
}
