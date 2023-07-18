import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:worldline_flutter/ui/viewmodels/root_viewmodel.dart';

abstract class RootScreen<S extends ViewState> extends StatelessWidget {
  const RootScreen({super.key});

  abstract final RootViewModel<S> viewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder(
        bloc: viewModel,
        builder: (context, state) => buildView(context, state as S),
      ),
    );
  }

  Widget buildView(BuildContext context, S state);
}
