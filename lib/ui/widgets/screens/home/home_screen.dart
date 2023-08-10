import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worldline_flutter/di/di.dart';
import 'package:worldline_flutter/ui/viewmodels/home/home_viewmodel.dart';
import 'package:worldline_flutter/ui/widgets/components/error_card.dart';
import 'package:worldline_flutter/ui/widgets/components/loading_circle.dart';
import 'package:worldline_flutter/ui/widgets/screens/root_screen.dart';

class HomeScreen extends RootScreen<HomeViewState> {
  HomeScreen({super.key});

  @override
  final HomeViewModel viewModel = getIt<HomeViewModel>();

  @override
  Widget buildView(BuildContext context, HomeViewState state) {
    return Scaffold(
      body: SafeArea(
        child: switch (state) {
          Loading _ => const LoadingCircle(),
          Success _ => state.list.isEmpty
              ? Center(child: Text("empty_list".tr()))
              : ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final item = state.list[index];
                    return ListTile(
                      key: Key(item.id),
                      leading: Image.network(item.image, width: 56, height: 56),
                      title: Text(item.title),
                      subtitle: Text(
                        "geocoordinates".tr(args: [item.geocoordinates]),
                      ),
                    );
                  },
                ),
          Error _ => ErrorCard(error: state.error),
        },
      ),
    );
  }
}
