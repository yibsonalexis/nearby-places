import 'package:flutter/material.dart';
import 'package:nearby_places/models/placeModel.dart';

class PlaceCard extends StatelessWidget {
  final PlacesModel place;
  const PlaceCard({@required this.place});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "placeDetailsPage", arguments: place);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: 108.0,
          padding: EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Hero(
                  tag: place.id,
                  child: FadeInImage(
                      width: size.width * 0.33,
                      height: 90.0,
                      fit: BoxFit.cover,
                      placeholder: AssetImage("assets/images/loading.gif"),
                      image: NetworkImage(place.icon)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        place.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        place.vicinity,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(fontSize: 14),
                        maxLines: 2,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            place.rating.toString(),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18.0,
                          ),
                          Text("(${place.userRatingsTotal})",
                              style: Theme.of(context).textTheme.caption)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Spacer(),
              IconButton(
                  icon: Icon(Icons.keyboard_arrow_right), onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
