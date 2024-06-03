# Use find until solve this issue https://github.com/dart-lang/dart_style/issues/864
fvm dart format $(find . -name "*.dart" -not -wholename "**/*.g.dart" -not -wholename "**/*.temp.dart") --set-exit-if-changed
