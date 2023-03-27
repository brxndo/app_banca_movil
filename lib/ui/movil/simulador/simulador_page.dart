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
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color.fromRGBO(172, 30, 35, 1),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            bottom: TabBar(
              controller: _tabController,
              indicator: const PointTabIndicator(
                position: PointTabIndicatorPosition.bottom,
                color: Colors.white,
                insets: EdgeInsets.only(bottom: 6),
              ),
              tabs: titulo.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.white,
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
