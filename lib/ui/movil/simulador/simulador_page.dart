import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';

import 'creditos_page.dart';
import 'plazo_fijo_page.dart';

class SimuladorPage extends StatefulWidget {
  const SimuladorPage({super.key});

  @override
  State<SimuladorPage> createState() => _SimuladorPageState();
}

class _SimuladorPageState extends State<SimuladorPage>
    with SingleTickerProviderStateMixin {
  final titulo = ['PLAZO FIJO', 'CRÉDITOS'];
  final screens = [const PlazoFijoPage(), CreditosPage()];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: screens.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            title: const Text(
              'Simuladores',
              style: TextStyle(color: Color.fromRGBO(172, 30, 35, 1)),
            ),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Color.fromRGBO(172, 30, 35, 1),
            ),
            // actions: [
            //   Image.asset(
            //     'assets/images/logo2.png',
            //     scale: 6,
            //   ),
            // ],
            bottom: TabBar(
              controller: _tabController,
              indicator: const PointTabIndicator(
                position: PointTabIndicatorPosition.bottom,
                color: Color.fromRGBO(172, 30, 35, 1),
                insets: EdgeInsets.only(bottom: 6),
              ),
              tabs: titulo.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Color.fromRGBO(172, 30, 35, 1),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: screens,
        ),
      ),
    );
  }
}
