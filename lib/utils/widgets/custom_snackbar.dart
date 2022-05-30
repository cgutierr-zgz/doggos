import 'package:doggos/utils/utils.dart';
import 'package:flutter/material.dart';

extension SnackbarActions on CustomSnackBar {
  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: backgroundColor, content: this),
    );
  }
}

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
    required this.message,
    this.prefixIcon,
    this.backgroundColor,
  });
  factory CustomSnackBar.info({required String message}) => CustomSnackBar(
        message: message,
        prefixIcon: Icons.info,
      );

  factory CustomSnackBar.error({required String message}) {
    return CustomSnackBar(
      message: message,
      prefixIcon: Icons.error,
      backgroundColor: Colors.redAccent,
    );
  }
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final String message;

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return Row(
      children: [
        leftIcon(),
        HorizontalSpacer.semi(),
        text(),
      ],
    );
  }

  Widget leftIcon() {
    return Builder(
      builder: (context) {
        return Icon(
          prefixIcon,
          size: 22,
          color: Theme.of(context).snackBarTheme.contentTextStyle?.color,
        );
      },
    );
  }

  Widget text() {
    return Builder(
      builder: (context) {
        return Expanded(
          child: Text(
            message,
            maxLines: 4,
            style: Theme.of(context).snackBarTheme.contentTextStyle,
          ),
        );
      },
    );
  }
}
