import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class CardContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const CardContainer({super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    double ancho = double.infinity;
    if (!Responsive.isMobile(context)) {
      ancho = 400;
    }
    return Container(
      height: height,
      width: ancho,
      padding: EdgeInsets.symmetric(horizontal: 50),
      decoration: _createCardShape(),
      child: this.child,
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}
