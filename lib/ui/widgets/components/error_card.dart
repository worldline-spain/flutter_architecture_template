import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:worldline_flutter/domain/models/errors.dart';
import 'package:worldline_flutter/ui/styles/app_colors.dart';
import 'package:worldline_flutter/ui/styles/insets.dart';
import 'package:worldline_flutter/ui/styles/text_styles.dart';
import 'package:worldline_flutter/ui/widgets/components/box_spacer.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({required this.error, super.key});

  final MainError error;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.errorBackground,
      margin: Insets.a16,
      child: Padding(
        padding: Insets.a16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, size: 48),
            BoxSpacer.v8(),
            Text(
              error.message,
              style: TextStyles.errorMessage,
            ),
          ],
        ),
      ),
    );
  }
}

extension ErrorMessage on MainError {
  String get message {
    switch (runtimeType) {
      case NoInternet:
        return "errors.no_internet".tr();
      case ServerError:
        return "errors.server".tr();
      case BadRequestError:
        return "errors.bad_request".tr();
      case ForbiddenError:
        return "errors.forbidden".tr();
      case NotFoundError:
        return "errors.not_found".tr();
      case UnauthError:
        return "errors.unauthorized".tr();
      case ExpiredSessionError:
        return "errors.expired_session".tr();
      case UnknownError:
      default:
        return "errors.unknown".tr();
    }
  }
}
