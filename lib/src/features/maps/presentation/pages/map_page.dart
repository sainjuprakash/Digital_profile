import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  double latitude, longitude;
  MapsPage(this.latitude, this.longitude, {super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  String _selectedValue = 'OSM';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FlutterMap(
            options: MapOptions(
                initialCenter: LatLng(widget.latitude, widget.longitude),
                initialZoom: 15,
                interactionOptions: const InteractionOptions(
                    flags: ~InteractiveFlag.doubleTapZoom)),
            children: [
              _selectedValue == 'OSM'
                  ? openStreetMapTileLayer
                  : satelliteTileLayer,
              MarkerLayer(markers: [
                Marker(
                    width: 15,
                    height: 30,
                    point: LatLng(widget.latitude.toDouble(),
                        widget.longitude.toDouble()),
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 30,
                    ),
                    alignment: Alignment.centerLeft),
              ])
            ]),
        Align(
          alignment: const Alignment(0.8, 0.97),
          child: Container(
            height: 90,
            width: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text('OSM', style: TextStyle(fontSize: 10)),
                    value: 'OSM',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title:
                        const Text('satellite', style: TextStyle(fontSize: 10)),
                    value: 'satellite',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleflet.flutter_map.example',
    );

TileLayer get satelliteTileLayer => TileLayer(
      urlTemplate:
          'http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}',
      userAgentPackageName: 'dev.fleflet.flutter_map.example',
    );
