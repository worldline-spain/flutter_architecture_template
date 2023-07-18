import 'package:flutter/widgets.dart';
import 'package:worldline_flutter/ui/styles/spacing.dart';

class BoxSpacer extends StatelessWidget {
  final double? horizontalSpacing;
  final double? verticalSpacing;

  const BoxSpacer({
    super.key,
    this.horizontalSpacing,
    this.verticalSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: verticalSpacing,
      width: horizontalSpacing,
    );
  }

  // Horizontal spacers
  factory BoxSpacer.h4() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp4);
  }

  factory BoxSpacer.h8() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp8);
  }

  factory BoxSpacer.h12() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp12);
  }

  factory BoxSpacer.h16() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp16);
  }

  factory BoxSpacer.h20() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp20);
  }

  factory BoxSpacer.h24() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp24);
  }

  factory BoxSpacer.h32() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp32);
  }

  factory BoxSpacer.h40() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp40);
  }

  factory BoxSpacer.h48() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp48);
  }

  factory BoxSpacer.h56() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp56);
  }

  factory BoxSpacer.h64() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp64);
  }

  factory BoxSpacer.h80() {
    return const BoxSpacer(horizontalSpacing: Spacing.sp80);
  }

  // Vertical spacers
  factory BoxSpacer.v4() {
    return const BoxSpacer(verticalSpacing: Spacing.sp4);
  }

  factory BoxSpacer.v8() {
    return const BoxSpacer(verticalSpacing: Spacing.sp8);
  }

  factory BoxSpacer.v12() {
    return const BoxSpacer(verticalSpacing: Spacing.sp12);
  }

  factory BoxSpacer.v16() {
    return const BoxSpacer(verticalSpacing: Spacing.sp16);
  }

  factory BoxSpacer.v20() {
    return const BoxSpacer(verticalSpacing: Spacing.sp20);
  }

  factory BoxSpacer.v24() {
    return const BoxSpacer(verticalSpacing: Spacing.sp24);
  }

  factory BoxSpacer.v32() {
    return const BoxSpacer(verticalSpacing: Spacing.sp32);
  }

  factory BoxSpacer.v40() {
    return const BoxSpacer(verticalSpacing: Spacing.sp40);
  }

  factory BoxSpacer.v48() {
    return const BoxSpacer(verticalSpacing: Spacing.sp48);
  }

  factory BoxSpacer.v56() {
    return const BoxSpacer(verticalSpacing: Spacing.sp56);
  }

  factory BoxSpacer.v64() {
    return const BoxSpacer(verticalSpacing: Spacing.sp64);
  }

  factory BoxSpacer.v80() {
    return const BoxSpacer(verticalSpacing: Spacing.sp80);
  }
}
