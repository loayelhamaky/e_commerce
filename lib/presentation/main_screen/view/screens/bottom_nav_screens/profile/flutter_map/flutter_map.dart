import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? selectedLocation;

  @override
  void initState() {
    super.initState();
    _loadSavedLocation();
  }

  Future<void> _loadSavedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final latitude = prefs.getDouble('latitude');
    final longitude = prefs.getDouble('longitude');
    if (latitude != null && longitude != null) {
      setState(() {
        selectedLocation = LatLng(latitude, longitude);
      });
    }
  }

  Future<void> _saveLocation(LatLng location) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('latitude', location.latitude);
    await prefs.setDouble('longitude', location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: selectedLocation ?? LatLng(30.033333, 31.233334),
          initialZoom: 13.0,
          onTap: (tapPosition, latLng) {
            setState(() {
              selectedLocation = latLng;
            });
            _saveLocation(latLng);
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              if (selectedLocation != null)
                Marker(
                  point: selectedLocation!,
                  width: 40.w,
                  height: 40.h,
                  child:  Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 40.sp,
                  ),
                ),

            ],
          ),
        ],
      ),
    );
  }
}
