import 'package:app_banca_virtual_movil_2/ui/theme/app_theme.dart';
import 'package:app_banca_virtual_movil_2/ui/web/register_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:flutter_custom_tab_bar/indicator/linear_indicator.dart';
import 'package:flutter_custom_tab_bar/transform/color_transform.dart';

import '../widgets/card_container.dart';
import 'login_web.dart';

class IndexPageWeb extends StatefulWidget {
  const IndexPageWeb({super.key});

  @override
  State<IndexPageWeb> createState() => _IndexPageWebState();
}

class _IndexPageWebState extends State<IndexPageWeb> {
  final int pageCount = 2;
  final PageController _controller = PageController(initialPage: 0);
  final CustomTabBarController _tabBarController = CustomTabBarController();

  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
      index: index,
      transform: ColorsTransform(
          highlightColor: Colors.black,
          normalColor: Colors.black,
          builder: (context, color) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              constraints: BoxConstraints(minWidth: 20),
              child: Text(
                index == 0 ? 'Iniciar Sesión' : 'Registrarme',
                style: TextStyle(fontSize: 14, color: color),
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.white,
            title: Image.asset(
              'assets/images/logo.png',
              scale: 4,
            ),
            centerTitle: true,
            elevation: 2,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CardContainer(
                  height: MediaQuery.of(context).size.height * 0.78,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(
                      //   Icons.groups_2,
                      //   size: 90,
                      //   color: AppTheme.primaryColor,
                      // ),
                      Image.asset(
                        'assets/images/avatar.gif',
                        scale: 5,
                      ),
                      Text(
                        'DaquiOnline - PERSONAS',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 225,
                        child: CustomTabBar(
                          tabBarController: _tabBarController,
                          height: 35,
                          itemCount: pageCount,
                          builder: getTabbarChild,
                          indicator: LinearIndicator(
                            color: AppTheme.primaryColor,
                            bottom: 5,
                          ),
                          pageController: _controller,
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: pageCount,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const LoginWeb();
                            } else {
                              return RegisterWeb();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black54,
          height: 60,
          width: double.infinity,
          child: const Center(
            child: Text(
              '©COOPERATIVA DAQUILEMA 2023 - Todos los derechos reservados',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
