// To parse this JSON data, do
//
//     final placesModel = placesModelFromJson(jsonString);

import 'dart:convert';

PlacesModel placesModelFromJson(String str) => PlacesModel.fromJson(json.decode(str));

String placesModelToJson(PlacesModel data) => json.encode(data.toJson());

class PlacesModel {
    PlacesModel({
        this.businessStatus,
        this.icon,
        this.id,
        this.name,
        this.placeId,
        this.priceLevel,
        this.rating,
        this.reference,
        this.scope,
        this.types,
        this.userRatingsTotal,
        this.vicinity,
    });

    String businessStatus;
    String icon;
    String id;
    String name;
    String placeId;
    dynamic priceLevel;
    dynamic rating;
    String reference;
    String scope;
    List<String> types;
    dynamic userRatingsTotal;
    String vicinity;

    factory PlacesModel.fromJson(Map<String, dynamic> json) => PlacesModel(
        businessStatus: json["business_status"],
        icon: json["icon"],
        id: json["id"],
        name: json["name"],
        placeId: json["place_id"],
        priceLevel: json["price_level"],
        rating: json["rating"],
        reference: json["reference"],
        scope: json["scope"],
        types: List<String>.from(json["types"].map((x) => x)),
        userRatingsTotal: json["user_ratings_total"],
        vicinity: json["vicinity"],
    );

    Map<String, dynamic> toJson() => {
        "business_status": businessStatus,
        "icon": icon,
        "id": id,
        "name": name,
        "place_id": placeId,
        "price_level": priceLevel,
        "rating": rating,
        "reference": reference,
        "scope": scope,
        "types": List<dynamic>.from(types.map((x) => x)),
        "user_ratings_total": userRatingsTotal,
        "vicinity": vicinity,
    };
}
