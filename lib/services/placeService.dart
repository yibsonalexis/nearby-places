import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nearby_places/models/placeModel.dart';

class PlaceService {
  String _apiKey = "AIzaSyCW_4fxqsIu4m792qFH9jPRGmC14kkkA1Q";

  String _url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  Future<List<PlacesModel>> getPlaces(double lat, double lon) async {
    try {
      List<PlacesModel> places = List<PlacesModel>();
      var response = await http.get(
          "$_url?location=$lat,$lon&radius=1500&type=restaurant&key=$_apiKey",
          headers: {"Accept": "application/json"});
      // var response = await http.get(
      //     "$_url ?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=$_apiKey",
      //     headers: {"Accept": "application/json"});

      final decodedData = json.decode(response.body);
      final List<dynamic> listResult = decodedData["results"];
      places = listResult.map((e) => PlacesModel.fromJson(e)).toList();
      return places;
    } catch (e) {
      return List<PlacesModel>();
    }
  }
}
