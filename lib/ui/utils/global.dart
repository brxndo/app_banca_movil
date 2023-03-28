import 'package:flutter/material.dart';

const defaultPadding = 16.0;
const double globalDefaultButtonHeight = 45;

Widget? GlogalSessionCurrenPage;

int globalSelectedIndexSideMenuDesktop = 0;

bool globalIsDarkSelected = false;

String globalStringTituloApp_ = "DaquiApp";

String globalTituloApp = globalStringTituloApp_;
String globalPathLogoApp = "assets/images/logo2.png";

IconButton globalIconButon =
    IconButton(icon: Image.asset(globalPathLogoApp), onPressed: null);

VoidCallback? globalBackButtonActionCallback = null;

void setHeaderInHome(BuildContext context) {
  globalIconButon =
      IconButton(icon: Image.asset(globalPathLogoApp), onPressed: null);
  globalTituloApp = globalStringTituloApp_;
  globalBackButtonActionCallback = null;
}

// void globalShowToast(String msj){
//   Fluttertoast.showToast(
//         msg: msj,
//         toastLength: Toast.LENGTH_LONG,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0
//     );
// }