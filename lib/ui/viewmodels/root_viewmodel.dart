import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RootViewModel<S> extends Cubit<ViewState> {
  RootViewModel(super.initialState) {
    onAttach();
  }

  void emitValue(ViewState state) {
    super.emit(state);
  }

  void onAttach();
}

abstract class ViewState {}
