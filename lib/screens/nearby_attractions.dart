import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../modals/attractiondata.dart';
import '../modals/graphQlConstant.dart';
import '../widgets/grid_attractions.dart';

class NearbyAttractions extends StatefulWidget {
  final ThemeData? themeData;
  final int? provinceId;
  NearbyAttractions({this.themeData, this.provinceId});
  @override
  _NearbyAttractionsState createState() => _NearbyAttractionsState();
}

class _NearbyAttractionsState extends State<NearbyAttractions> {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
          document: gql(nearbyAttractionsList),
          variables: <String, dynamic>{"id": widget.provinceId}),
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
                  'Loading Attractions.',
                  style: widget.themeData!.textTheme.bodyText1,
                ),
              )
            ],
          );
        } else if (result.data == null) {
          return Center(child: Text("No Data Found !"));
        } else {
          List<Attraction>? attractions =
              NearbyData.fromJson(result.data!).attractionList;

          return GridAttractions(
              themeData: widget.themeData, attractions: attractions);
        }
      },
    );
  }
}
