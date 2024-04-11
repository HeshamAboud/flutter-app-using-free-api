import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../modals/attractiondata.dart';
import '../screens/place_detail.dart';
import '../utils/custom_image.dart';

class GridAttractions extends StatelessWidget {
  final List<Attraction>? attractions;
  final ThemeData? themeData;
  GridAttractions({this.attractions, this.themeData});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeData!.primaryColor,
      padding: EdgeInsets.only(top: 8),
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: attractions!.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlaceDetail(
                            place: attractions![index],
                            heroId: attractions![index].name,
                            themeData: themeData,
                          )));
            },
            child: Stack(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(left: 8, right: 8, bottom: 30),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    child: Hero(
                      tag: attractions![index].name!,
                      child: FadeInImage(
                        image: customImage(attractions![index].image),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: AssetImage('assets/images/loading.gif'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 8,
                  child: Card(
                    color: themeData!.primaryColorDark,
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(attractions![index].name!,
                              style: themeData!.textTheme.bodyText1,
                              overflow: TextOverflow.ellipsis),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: themeData!.colorScheme.secondary,
                                size: 20,
                              ),
                              Text(attractions![index].district!,
                                  style: themeData!.textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
