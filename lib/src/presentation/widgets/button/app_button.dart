import 'package:flutter/material.dart';
import 'package:computer_shop_app/src/utils/constants/app_theme.dart';

class AppButton {

  static ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.red,
    minimumSize: const Size.fromHeight(40),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static ButtonStyle disableButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.black20,
    minimumSize: const Size.fromHeight(40),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static ButtonStyle rejectButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.red,
    minimumSize: const Size.fromHeight(40),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static ButtonStyle loginButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppTheme.white,
    shadowColor: AppTheme.transparent,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: AppTheme.greenLight20),
    ),
  );
}
