import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class IconTextCustom extends StatelessWidget {
  final String label;
  final IconData icono;
  final VoidCallback onPressed;

  const IconTextCustom(
      {super.key,
      required this.label,
      required this.icono,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppTheme.backgorundColor),
        ),
        child: SizedBox(
          height: 95,
          width: 95,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
            child: Column(
              children: [
                Center(
                    child: Icon(
                  icono,
                  size: 45,
                  color: AppTheme.primaryColor,
                )),
                Text(label,
                    style: TextStyle(color: AppTheme.primaryColor, height: 1.1),
                    maxLines: 2,
                    textAlign: TextAlign.center)
              ],
            ),
          ),
        ));
  }
}
