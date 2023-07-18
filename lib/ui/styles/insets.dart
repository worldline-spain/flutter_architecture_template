import 'package:flutter/widgets.dart';
import 'package:worldline_flutter/ui/styles/spacing.dart';

class Insets {
  /// Zero
  static const zero = EdgeInsets.zero;

  /// All with sp `4`
  static const a4 = EdgeInsets.all(Spacing.sp4);

  /// All with sp `12`
  static const a12 = EdgeInsets.all(Spacing.sp12);

  /// All with sp `16`
  static const a16 = EdgeInsets.all(Spacing.sp16);

  /// All with sp `20`
  static const a20 = EdgeInsets.all(Spacing.sp20);

  /// Horizontal with sp `4`
  static const h4 = EdgeInsets.symmetric(horizontal: Spacing.sp4);

  /// Horizontal with sp `8`
  static const h8 = EdgeInsets.symmetric(horizontal: Spacing.sp8);

  /// Horizontal with sp `12`
  static const h12 = EdgeInsets.symmetric(horizontal: Spacing.sp12);

  /// Horizontal with sp `16`
  static const h16 = EdgeInsets.symmetric(horizontal: Spacing.sp16);

  /// Horizontal with sp `24`
  static const h24 = EdgeInsets.symmetric(horizontal: Spacing.sp24);

  /// Vertical with sp `8`
  static const v8 = EdgeInsets.symmetric(vertical: Spacing.sp8);

  /// Vertical with sp `12`
  static const v12 = EdgeInsets.symmetric(vertical: Spacing.sp12);

  /// Vertical with sp `24`
  static const v24 = EdgeInsets.symmetric(vertical: Spacing.sp24);

  /// Only left with sp `16`
  static const ol16 = EdgeInsets.only(left: Spacing.sp16);

  /// Only right with sp `16`
  static const or16 = EdgeInsets.only(right: Spacing.sp16);

  /// Only bottom with sp `20`
  static const ob20 = EdgeInsets.only(bottom: Spacing.sp20);

  /// Only bottom with sp `24`
  static const ob24 = EdgeInsets.only(bottom: Spacing.sp24);

  /// Only bottom with sp `32`
  static const ob32 = EdgeInsets.only(bottom: Spacing.sp32);

  /// Only bottom with sp `48`
  static const ob48 = EdgeInsets.only(bottom: Spacing.sp48);
}
