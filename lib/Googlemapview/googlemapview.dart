import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatefulWidget {
  @override
  _GoogleMapViewState createState() => _GoogleMapViewState();
}

class _GoogleMapViewState extends State<GoogleMapView> {
  Completer<GoogleMapController> _controller = Completer();
  MapType type;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
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
                  child: Icon(Icons.map),
                ),
                // FlatButton(
                //   child: Icon(Icons.zoom_in),
                //   onPressed: () async {
                //     (await _controller.future)
                //         .animateCamera(CameraUpdate.zoomIn());
                //   },
                // ),
                // RaisedButton(
                //   child: Icon(Icons.zoom_out),
                //   onPressed: () async {
                //     (await _controller.future)
                //         .animateCamera(CameraUpdate.zoomOut());
                //   },
                // ),
                // FloatingActionButton.extended(
                //   icon: Icon(Icons.location_on),
                //   label: Text("My position"),
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
