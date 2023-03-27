import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ancho = double.infinity;
    if (!Responsive.isMobile(context)) {
      ancho = 400;
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: ancho,
        padding: EdgeInsets.all(20),
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}
