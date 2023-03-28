import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ButtonIconTextCustom extends StatelessWidget {
  final String label;
  final IconData icono;
  final VoidCallback onTap;

  const ButtonIconTextCustom(
      {super.key,
      required this.label,
      required this.icono,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppTheme.backgorundColor),
          elevation: const MaterialStatePropertyAll(5),
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
                  color: AppTheme.secondColor,
                )),
                Text(
                  label,
                  style: TextStyle(color: AppTheme.secondColor, height: 1.1),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}
