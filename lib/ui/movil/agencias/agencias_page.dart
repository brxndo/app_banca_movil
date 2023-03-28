import 'dart:async';

import 'package:clippy_flutter/triangle.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/providers/agencias_provider.dart';

List<List<dynamic>> agencias = [
  [
    'AGENCIA MATRIZ',
    'Veloz N° 24 - 16 entre Larrea y España.\nTelf: 032 962706 Ext. 100 - Cel: 0990311440',
    -1.6710780792566349,
    -78.64955685013504,
  ],
  [
    'AGENCIA RIOBAMBA LA CONDAMINE',
    'Juan Lavalle 30-48 y Chile. Sector C.C.LA CONDAMINE.\nTelf: 032 962706 Ext. 100 - Cel: 0990311440',
    -1.671247346098182,
    -78.65623065024478,
  ],
  [
    'AGENCIA QUITO NORTE',
    'Av. Diego de Vásquez de Cepeda N° 508 y Nazacota Puento\n 2 cuadras al sur del MERCADO COTOCOLLAO.\nTelf.: 03 2962706 Ext. 201 - Cel:0990311440',
    -0.11757270178604201,
    -78.49100819035066,
  ],
  [
    'AGENCIA QUITO CENTRO',
    'Mejía 438 y Venezuela, Centro Histórico de Quito.\nTelf: 03 2962706 Ext. 301 - Cel: 0990311440',
    -0.21926799999999266,
    -78.5113203411044,
  ],
  [
    'AGENCIA QUITO SUR',
    'Av. Mariscal Sucre 2351 y Las Pampas Sector LA GATAZO\nTelf: 03 2962706 Ext.: 401 - Cel: 0990311440',
    -0.26285791489184235,
    -78.54885430919819,
  ],
  [
    'AGENCIA SANTO DOMINGO',
    'Av. Quito entre las calles Tsáchilas y Tulcán, frente Parque\nZaracay, diagonal al Municipio del cantón Santo Domingo. \nTelf: 03 2962706 Ext. 901 - Cel: 0990311440',
    -0.2551391377786258,
    -79.16884681031682,
  ],
  [
    'AGENCIA LATACUNGA',
    'Panamericana Norte, Avda. Eloy Alfaro, Barrio la Estación \nTelf: 03 2962706 Ext. 1600 - Cel: 0990311440',
    -0.9306193637103312,
    -78.62236563558245,
  ],
  [
    'AGENCIA AMBATO',
    'Juan Benigno Vela Nº 03 - 20 y Eugenio Espejo.\nTelf: 032 962706 Ext. 1500 - Cel: 0990311440',
    -1.2412316368399134,
    -78.6253493645326,
  ],
  [
    'AGENCIA GUARANDA',
    'Calle García Moreno y Eloy Alfaro; Sector la Plaza Roja.\nTelf: 03 2962706 Ext. 1701 - Cel: 0990311440',
    -1.590817378828682,
    -78.99786588713589,
  ],
  [
    'AGENCIA GUAMOTE',
    'Av. Panamericana Sur y Av. Macas frente a la\nGasolinera Petrocomercial.\nTelf: 03 2962706 Ext. 1100 - Cel: 0990311440',
    -1.9344192496684023,
    -78.70723601582111,
  ],
  [
    'AGENCIA ALAUSÍ',
    'Av. 5 de Junio y Carlos Catanni\nTelf: 03 2962706 Ext. 1200 - Cel: 0990311440',
    -2.205498675109053,
    -78.84760834110439,
  ],
  [
    'AGENCIA CAÑAR',
    'Pichincha y Borrero.\nFrente al Parque Central de la ciudad de Cañar\nTelf: 03 2962706 Ext. 1400 - Cel: 0990311440',
    -2.5595648569982195,
    -78.93770386557472,
  ],
  [
    'AGENCIA CUENCA',
    'Av. Del Estadio Nº 4-48 entre Av. Manuel J. Calle y José Peralta,\nSector El Vergel, Frente al Estadio.\nTelf: 032 962706 Ext. 1801 - Cel: 0990311440',
    -2.907113266835809,
    -79.00492252760968,
  ],
  [
    'AGENCIA MACHALA',
    'Avda. 25 de Junio 969 y Tarqui (Vía principal),\njunto a Impacar, frente a escuela Bolivia Benítez.\nTelf: 03 2962706 Ext. 1300 - Cel: 0990311440',
    -3.2614277674044314,
    -79.95623517294581,
  ],
  [
    'AGENCIA GUAYAQUIL NORTE',
    'AGENCIA GUAYAQUIL NORTE Km. 11.5 - Vía a Daule \nParque Comercial California. Local R7-8.\nTelf: 03 2962706 Ext. 501 - Cel: 0990311440',
    -2.1000200384698005,
    -79.93739888115734,
  ],
  [
    'AGENCIA GUAYAQUIL CENTRO',
    'José Vélez 819 entre Lorenzo de Garaicoa y 6 de Marzo.\nFrente al Parque Centenario\nTelf: 03 2962706 Ext. 801 - Cel: 0990311440',
    -2.191146751549518,
    -79.88751402330739,
  ],
  [
    'AGENCIA DURÁN',
    'Av. Nicolás Lapentti Km. 1.5,Terminal Terrestre \nde la ciudad de Durán.\nTelf: 032 962706 Ext. 1901 - Cel: 0990311440',
    -2.1785829239184977,
    -79.82389912074215,
  ],
  [
    'AGENCIA LA LIBERTAD',
    'Avenida 7ma. entre las calles 21 y 22. Frente al \nMercado “Unidos Venceremos”\nTelf: 03 2962706 Ext. 1001 - Cel: 0990311440',
    -2.2249682370285497,
    -80.90775809558295,
  ],
  [
    'AGENCIA MILAGRO',
    'Av. Juan Montalvo 936 entre Eloy Alfaro y 12 de Febrero.\nTelf: 03 2962706 Ext. 2001 - Cel: 0990311440',
    -2.128999917855163,
    -79.59120367055219,
  ],
];

CustomInfoWindowController _customInfoWindowController =
    CustomInfoWindowController();

class AgenciasPage extends ConsumerStatefulWidget {
  const AgenciasPage({super.key});

  @override
  ConsumerState<AgenciasPage> createState() => _AgenciasPageState();
}

class _AgenciasPageState extends ConsumerState<AgenciasPage> {
  Set<Marker> markers = {};

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _matrizRiobamba = CameraPosition(
    target: LatLng(-1.6710780792566349, -78.64955685013504),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    ref.read(agenciasProvider).loadMapStyle();
    agregarAgencias();
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void agregarAgencias() {
    for (var agencia in agencias) {
      markers.add(
        Marker(
          markerId: MarkerId(agencia[0]),
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/logo2.png',
                                  scale: 7,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                FittedBox(
                                  child: Text(
                                    agencia[0],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      // fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              child: Text(
                                agencia[1],
                                textAlign: TextAlign.center,
                                // style: const TextStyle(
                                //     fontSize: 14, color: Colors.black),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Triangle.isosceles(
                    edge: Edge.BOTTOM,
                    child: Container(
                      color: Colors.black,
                      width: 20.0,
                      height: 10.0,
                    ),
                  ),
                ],
              ),
              LatLng(agencia[2], agencia[3]),
            );
          },
          // flat: true,
          position: LatLng(agencia[2], agencia[3]),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            title: const Text(
              'Agencias y Contactos',
              style: TextStyle(color: Color.fromRGBO(172, 30, 35, 1)),
            ),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Color.fromRGBO(172, 30, 35, 1),
            ),
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.62,
                width: double.infinity,
                child: Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: _matrizRiobamba,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        _customInfoWindowController.googleMapController =
                            controller;
                        ref.watch(agenciasProvider).setMapStyle();
                      },
                      onTap: (position) {
                        _customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove!();
                      },
                      markers: markers,
                    ),
                    CustomInfoWindow(
                      controller: _customInfoWindowController,
                      height: MediaQuery.of(context).size.height * 0.12,
                      width: MediaQuery.of(context).size.width * 0.8,
                      offset: 50,
                    ),
                  ],
                ),
              ),
              const _FooterInformation(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterInformation extends ConsumerWidget {
  const _FooterInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Card(
            elevation: 5,
            child: Column(children: const [
              Text(
                'Horarios de Atención',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                'LUNES A VIERNES:   8H30 - 17H30\nSÁBADOS:                8H30 - 14H00',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Síguenos en nuestras redes sociales',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionChip(
              elevation: 6,
              pressElevation: 2,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                backgroundColor: Color(0xFF4267B2),
                child: Icon(
                  Icons.facebook_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              label: const Text(
                'Facebook',
                style: TextStyle(
                    // color: globalIsDarkSelected
                    //     ? AppThemeDark.textColor
                    //     : AppTheme.textColor,
                    ),
              ),
              onPressed: () {
                ref.watch(agenciasProvider).abrirUrl(
                    'fb://facewebmodal/f?href=https://www.facebook.com/coopdaquilema');
              },
              backgroundColor: Colors.white,
              // backgroundColor: globalIsDarkSelected
              //     ? AppThemeDark.backgorundColor
              //     : AppTheme.backgorundColor,
              shape: const StadiumBorder(
                  side: BorderSide(
                width: 1,
                color: Color(0xFF4267B2),
              )),
            ),
            ActionChip(
              elevation: 6,
              pressElevation: 2,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                backgroundColor: Color(0xFF1DA1F2),
                child: Icon(
                  FontAwesomeIcons.twitter,
                  color: Colors.white,
                  size: 17,
                ),
              ),
              label: const Text(
                'Twitter',
                style: TextStyle(
                    // color: globalIsDarkSelected
                    //     ? AppThemeDark.textColor
                    //     : AppTheme.textColor,
                    ),
              ),
              onPressed: () {
                ref
                    .watch(agenciasProvider)
                    .abrirUrl('https://twitter.com/coopdaquilema');
              },
              backgroundColor: Colors.white,
              // backgroundColor: globalIsDarkSelected
              //     ? AppThemeDark.backgorundColor
              //     : AppTheme.backgorundColor,
              shape: const StadiumBorder(
                  side: BorderSide(
                width: 1,
                color: Color(0xFF1DA1F2),
              )),
            ),
            ActionChip(
              elevation: 6,
              pressElevation: 2,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                backgroundColor: Color(0xFFFF0000),
                child: Icon(
                  FontAwesomeIcons.youtube,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              label: const Text(
                'YouTube',
                style: TextStyle(
                    // color: globalIsDarkSelected
                    //     ? AppThemeDark.textColor
                    //     : AppTheme.textColor,
                    ),
              ),
              onPressed: () {
                ref
                    .watch(agenciasProvider)
                    .abrirUrl('https://www.youtube.com/@coopdaquilema8749');
              },
              backgroundColor: Colors.white,
              // backgroundColor: globalIsDarkSelected
              //     ? AppThemeDark.backgorundColor
              //     : AppTheme.backgorundColor,
              shape: const StadiumBorder(
                  side: BorderSide(
                width: 1,
                color: Color(0xFFFF0000),
              )),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ActionChip(
              elevation: 6,
              pressElevation: 2,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                backgroundColor: Color(0xFFE1306C),
                child: Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              label: const Text(
                'Instagram',
                style: TextStyle(
                    // color: globalIsDarkSelected
                    //     ? AppThemeDark.textColor
                    //     : AppTheme.textColor,
                    ),
              ),
              onPressed: () {
                ref
                    .watch(agenciasProvider)
                    .abrirUrl('https://www.instagram.com/coopdaquilema');
              },
              backgroundColor: Colors.white,
              // backgroundColor: globalIsDarkSelected
              //     ? AppThemeDark.backgorundColor
              //     : AppTheme.backgorundColor,
              shape: const StadiumBorder(
                  side: BorderSide(
                width: 1,
                color: Color(0xFFC13584),
              )),
            ),
            ActionChip(
              elevation: 6,
              pressElevation: 2,
              padding: const EdgeInsets.all(2.0),
              avatar: const CircleAvatar(
                backgroundColor: Color.fromRGBO(172, 30, 35, 1),
                child: Icon(
                  FontAwesomeIcons.globe,
                  color: Colors.white,
                  size: 17,
                ),
              ),
              label: const Text(
                'Web',
                style: TextStyle(
                    // color: globalIsDarkSelected
                    //     ? AppThemeDark.textColor
                    //     : AppTheme.textColor,
                    ),
              ),
              onPressed: () {
                ref
                    .watch(agenciasProvider)
                    .abrirUrl('https://www.coopdaquilema.com/');
              },
              backgroundColor: Colors.white,
              // backgroundColor: globalIsDarkSelected
              //     ? AppThemeDark.backgorundColor
              //     : AppTheme.backgorundColor,
              shape: const StadiumBorder(
                  side: BorderSide(
                width: 1,
                color: Color.fromRGBO(172, 30, 35, 1),
              )),
            ),
          ],
        ),
      ],
    );
  }
}
