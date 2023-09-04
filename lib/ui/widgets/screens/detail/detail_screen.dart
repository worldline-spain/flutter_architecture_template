import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail.title'.tr()),
      ),
      body: Center(
        child: Text('detail.body'.tr()),
      ),
    );
  }
}
