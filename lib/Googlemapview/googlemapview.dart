import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:flutter_polyline_points/flutter_polyline_points.dart';


// const double CAMERA_ZOOM = 13;
// const double CAMERA_TILT = 0;
// const double CAMERA_BEARING = 30;
// const LatLng SOURCE_LOCATION = LatLng(12.934533, 77.626579);
// const LatLng DEST_LOCATION = LatLng(12.9148979, 77.61267069999997);

// class GoogleMapView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => GoogleMapViewState();
// }

// class GoogleMapViewState extends State<GoogleMapView> {
//     Completer<GoogleMapController> _controller = Completer();
//     // this set will hold my markers
//     Set<Marker> _markers = {};
//     // this will hold the generated polylines
//     Set<Polyline> _polylines = {};
//     // this will hold each polyline coordinate as Lat and Lng pairs
//     List<LatLng> polylineCoordinates = [];
//     // this is the key object - the PolylinePoints
//     // which generates every polyline between start and finish
//     PolylinePoints polylinePoints = PolylinePoints();
//     String googleAPIKey = "<AIzaSyDL6L3bt-poVfCG6t_egMfkv52C3TKEB2Q>";
//     // for my custom icons
//     BitmapDescriptor sourceIcon;
//     BitmapDescriptor destinationIcon;

//     @override
//     void initState() {
//       super.initState();
//       setSourceAndDestinationIcons();
//     }

//     void setSourceAndDestinationIcons() async {
//       sourceIcon = await BitmapDescriptor.fromAssetImage(
//           ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving.png');
//       destinationIcon = await BitmapDescriptor.fromAssetImage(
//           ImageConfiguration(devicePixelRatio: 2.5),
//           'assets/destination.png');
//     }

//     @override
//     Widget build(BuildContext context) {
    
     
//       CameraPosition initialLocation = CameraPosition(
//           zoom: CAMERA_ZOOM,
//           bearing: CAMERA_BEARING,
//           tilt: CAMERA_TILT,
//           target: SOURCE_LOCATION);
//       return GoogleMap(
//           myLocationEnabled: true,
//           compassEnabled: true,
//           tiltGesturesEnabled: false,
//           markers: _markers,
//           polylines: _polylines,
//           mapType: MapType.normal,
//           initialCameraPosition: initialLocation,
//           onMapCreated: onMapCreated);
//     }

//     void onMapCreated(GoogleMapController controller) {
//       controller.setMapStyle(Utils.mapStyles);
//       _controller.complete(controller);
//       setMapPins();
//       //setPolylines();
//     }

//     void setMapPins() {
//       setState(() {
//         // source pin
//         _markers.add(Marker(
//             markerId: MarkerId('sourcePin'),
//             position: SOURCE_LOCATION,
//             icon: sourceIcon));
//         // destination pin
//         _markers.add(Marker(
//             markerId: MarkerId('destPin'),
//             position: DEST_LOCATION,
//             icon: destinationIcon));
//       });
//     }

// //     setPolylines() async {

// //         List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
// //             googleAPIKey,
// //             SOURCE_LOCATION.latitude,
// //             SOURCE_LOCATION.longitude,
// //             DEST_LOCATION.latitude,
// //             DEST_LOCATION.longitude);
// //         if (result.isNotEmpty) {
// //           // loop through all PointLatLng points and convert them
// //           // to a list of LatLng, required by the Polyline
// //           result.forEach((PointLatLng point) {
// //             polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// //           });
// //         }

// //       setState(() {
// //           // create a Polyline instance
// //           // with an id, an RGB color and the list of LatLng pairs
// //           Polyline polyline = Polyline(
// //               polylineId: PolylineId("poly"),
// //               color: Color.fromARGB(255, 40, 122, 198),
// //               points: polylineCoordinates);

// //           // add the constructed polyline as a set of points
// //           // to the polyline set, which will eventually
// //           // end up showing up on the map
// //           _polylines.add(polyline);
// //       });
// //   }
//  }

// class Utils {
//   static String mapStyles = '''[
//   {
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.icon",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.stroke",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative.land_parcel",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#bdbdbd"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "road",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#ffffff"
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#dadada"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "featureType": "road.local",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.line",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.station",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#c9c9c9"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   }
// ]''';
// }








class GoogleMapView extends StatefulWidget {
  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  Completer<GoogleMapController> _controller = Completer();
  MapType type;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(12.9148979, 77.61267069999997),
    zoom: 14.4746,
  );
  Set<Marker> markers;

  @override
  void initState() {
    super.initState();
    type = MapType.hybrid;

    markers = Set.from([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Track The Location',style: TextStyle(color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 19),),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () {
                
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/homescreen', (Route<dynamic> route) => false);
              },
            )

        ]
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: markers,
            mapType: type,
            onTap: (position) {
              Marker mk1 = Marker(
                markerId: MarkerId('1'),
                position: position,
              );
              setState(() {
                markers.add(mk1);
              });
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type = type == MapType.hybrid
                          ? MapType.normal
                          : MapType.hybrid;
                    });
                  },
                  child: Icon(Icons.map,
                  color: Colors.white,),
                ),
                FlatButton(
                  child: Icon(Icons.zoom_in),
                  onPressed: () async {
                    (await _controller.future)
                        .animateCamera(CameraUpdate.zoomIn());
                  },
                ),
                RaisedButton(
                  child: Icon(Icons.zoom_out),
                  onPressed: () async {
                    (await _controller.future)
                        .animateCamera(CameraUpdate.zoomOut());
                  },
                ),
                // FloatingActionButton.extended(
                //   icon: Icon(Icons.location_on),
                //   label: Text("My position",
                //   style: TextStyle(color:Colors.white),),
                //   onPressed: () {
                //     if (markers.length < 1) print("no marker added");
                //     print(markers.first.position);
                //   },
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}



