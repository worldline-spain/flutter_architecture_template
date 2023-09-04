import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/ui/viewmodels/root_viewmodel.dart';

abstract class RootScreen<T extends ViewState, V extends RootViewModel<T>>
    extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<V>();

    return BlocBuilder<V, T>(
      bloc: viewModel,
      builder: (context, state) {
        return buildView(context, state, viewModel);
      },
    );
  }

  Widget buildView(BuildContext context, T state, V viewModel);
}

abstract class RootScreenStateful<T extends ViewState,
    V extends RootViewModel<T>> extends StatefulWidget {
  const RootScreenStateful({super.key});

  @override
  RootScreenState<T, V, RootScreenStateful<T, V>> createState();
}

abstract class RootScreenState<T extends ViewState, V extends RootViewModel<T>,
    K extends RootScreenStateful<T, V>> extends State<K> {
  late final V viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<V>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<V, T>(
      bloc: viewModel,
      builder: (context, state) {
        return buildView(context, state, viewModel);
      },
    );
  }

  Widget buildView(BuildContext context, T state, V viewModel);
}
