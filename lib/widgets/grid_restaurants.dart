import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../modals/graphQlConstant.dart';
import '../modals/restaurantData.dart';
import '../screens/restaurantDetail.dart';
import '../utils/custom_image.dart';
class GridRestaurants extends StatefulWidget {
  final ThemeData? themeData;
  final int isWhat;

  GridRestaurants({this.themeData, this.isWhat = 0});
  @override
  _GridRestaurantsState createState() => _GridRestaurantsState();
}

class _GridRestaurantsState extends State<GridRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: gql(widget.isWhat == 0
              ? restaurantList
              : widget.isWhat == 1
                  ? cafeList
                  : pubList),
          variables: <String, dynamic>{}),
      builder: (QueryResult result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(widget.themeData!.colorScheme.secondary),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Loading ',
                  style: widget.themeData!.textTheme.bodyText1,
                ),
              )
            ],
          );
        } else if (result.data == null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Oops! Something went wrong !",
                  style: Theme.of(context).textTheme.bodyText1),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        widget.themeData!.colorScheme.secondary)),
                child: Text("Retry",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: widget.themeData!.primaryColor)),
                onPressed: () {
                  refetch!();
                },
              )
            ],
          );
        } else {
          List<Restaurant> restaurants = widget.isWhat == 0
              ? RestaurantData.fromJson(result.data!).restaurantList!
              : widget.isWhat == 1
                  ? RestaurantData.fromJson(result.data!).cafeList!
                  : RestaurantData.fromJson(result.data!).pubList!;
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: restaurants.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantDetail(
                                place: restaurants[index],
                                heroId: restaurants[index].name,
                                themeData: widget.themeData,
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
                          tag: restaurants[index].name!,
                          child: FadeInImage(
                            image: customImage(restaurants[index].image),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 8,
                      child: Card(
                        color: widget.themeData!.primaryColorDark,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(restaurants[index].name!,
                                  style: widget.themeData!.textTheme.bodyText1,
                                  overflow: TextOverflow.ellipsis),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: widget.themeData!.colorScheme.secondary,
                                    size: 20,
                                  ),
                                  Text(restaurants[index].district!,
                                      style:
                                          widget.themeData!.textTheme.bodyText1,
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
          );
        }
      },
    );
  }
}
