import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:nearby_places/models/placeModel.dart';
import 'package:nearby_places/preferences/userPreference.dart';
import 'package:nearby_places/services/placeService.dart';
import 'package:nearby_places/widgets/placeCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserPreferences _pref = UserPreferences();
  final PlaceService _placeService = new PlaceService();
  LatLng _initialLocation = LatLng(6.2, -75.5);

  @override
  void initState() {
    _initCurrentLocation();
    super.initState();
  }

  _initCurrentLocation() {
    Geolocator()
      ..getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
      ).then((position) {
        if (mounted) {
          _initialLocation = LatLng(position.latitude, position.longitude);

          setState(() => _initialLocation);
        }
      }).catchError((e) {
        print(e);
        //
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: _placeService.getPlaces(
                  _initialLocation.latitude, _initialLocation.longitude),
              // initialData: InitialData,
              builder: (BuildContext context,
                  AsyncSnapshot<List<PlacesModel>> snapshot) {
                List<PlacesModel> _places = List<PlacesModel>();
                _places = snapshot.data;
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                return Expanded(
                  child: ListView.builder(
                    itemCount: _places.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PlaceCard(place: _places[index]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Restaurantes Cercanos"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () {
              Navigator.pushReplacementNamed(context, "login");
            })
      ],
    );
  }
}
