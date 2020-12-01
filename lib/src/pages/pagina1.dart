import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onny_bus_usuario/src/pages/rutas.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:onny_bus_usuario/class/reqres_respuestas.dart';

class homes extends StatefulWidget {
  @override
  __homeState createState() => __homeState();
}

class __homeState extends State<homes> {
  List<String> longg = [];
  List<String> latt = [];
  String count;
  String lat;
  String long;
  final ruta=new rutas();
  
  Completer<GoogleMapController> _controller = Completer();

  Future<String> getHttp() async {
    var url = 'https://onny-bus.herokuapp.com/api/rutas/conductorByRuta/1#';
    var response = await http.get(url);
    // return reqResRespuestaFromJson(response.body);

   final body = jsonDecode(response.body);
    count='${body['data'].length}';
    //for (var i = 0; i < 3; i++) {
      lat = '${body['data'][1]['conductor']['latitud']}';
      long = '${body['data'][1]['conductor']['longitud']}';
      // longg[i]=long;
      // latt[i]=lat;
   // }

    print(lat);
    print(long);
   
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    FutureBuilder(
          future: getHttp(),
          builder: (BuildContext context, AsyncSnapshot <String> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
             }
           }
       );
    super.initState();
  }

  LatLng posicion1 = LatLng(10.986441, -74.8098);
  double elevations = 5.0;
  TextStyle estilo = TextStyle( fontSize: 20, fontWeight: FontWeight.bold, fontFamily: "lobster");
  Set<Polyline> polyline = Set<Polyline>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Onny-Bus",
          style: TextStyle(
              fontFamily: "lobster", color: Colors.black, fontSize: 30),
        )),
      ),
      body: GoogleMap  (
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: posicion1,
                  zoom: 12,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                polylines: polyline,
                 markers: _crearMarkersruta1(),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: [
                  Image.asset('assets/logo 2.png', width: 80, height: 100),
                  Center(
                      child: Text(
                    'Trasnmecar',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: "lobster"),
                  ))
                ],
              ),
              decoration: BoxDecoration(color: Colors.blue.withOpacity(1)),
            ),
            ListTile(
              title: Center(
                child: Text(
                  'Ruta1',
                  style: estilo,
                ),
              ),
              onTap: () {
                setState(() {
                  polyline.clear();
                  crearPolylineDeparture(
                    // rutacaracoli_ida,
                    ruta.ruta1_1()
                  );
                  createPolylineReturn(ruta.ruta1_2());
                });
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Center(child: Text('Ruta2', style: estilo)),
              onTap: () {
                setState(() {
                  polyline.clear();
                  crearPolylineDeparture(ruta.ruta2_1());
                  createPolylineReturn(ruta.ruta2_2());
                });
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Center(child: Text('Ruta3', style: estilo)),
              onTap: () {
                setState(() {
                  polyline.clear();
                });
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Center(child: Text('Ruta4', style: estilo)),
              onTap: () {
                setState(() {
                  polyline.clear();
            
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  crearPolylineDeparture(List valor) {
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap2"),
        zIndex: 1,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: valor,
        width: 6));
  }

  createPolylineReturn(List valor) {
    polyline.add(Polyline(
        polylineId: PolylineId("PolylineMap"),
        zIndex: 2,
        color: Colors.red,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.bevel,
        points: valor,
        width: 5));
  }

  // Set <Marker>_crearMarkersruta1() {
  //   var tmp= Set<Marker>();
  //   for (var i = 0; i < int.parse(count); i++) {
  //     tmp.add(
  //       Marker(
  //         markerId: MarkerId("aqui"),
  //         position: LatLng(double.parse(latt[i]), double.parse(longg[i])),

  //       ),
  //     );
  //   }
  //   return tmp;
  // }

//  Marker ruta1marker() {

//   }


 Set <Marker>_crearMarkersruta1() {
    var tmp= Set<Marker>();
    for (var i = 0; i < int.parse(count); i++) {
      tmp.add(
        Marker(
          markerId: MarkerId("aqui"),
          position: LatLng(double.parse(lat), double.parse(long)),

        ),
      );
    }
    return tmp;
  }

 

  
}
