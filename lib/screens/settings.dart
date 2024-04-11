import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_state.dart';
import '../utils/colors.dart';
import 'about_this_app.dart';
import 'all_hotels.dart';
import 'all_restaurants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int? option;
  final List<Color> colors = [
    lightThemePrimaryColor,
    darkThemePrimaryColor,
    amoledThemePrimaryColor
  ];
  final List<Color> borders = [
    lightThemeAccentColor,
    darkThemeAccentColor,
    amoledThemeAccentColor
  ];
  final List<String> themes = ['Light', 'Dark', 'Amoled'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ThemeState>(context);

    return Theme(
        data: state.themeData,
        child: Container(
          decoration: BoxDecoration(
              color: state.themeData.primaryColorDark,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // ListTile(
                  //   leading: Icon(
                  //     Icons.info,
                  //     color: Theme.of(context).accentColor,
                  //   ),
                  //   title: Text('About Nepal',
                  //       style: Theme.of(context).textTheme.bodyText1),
                  // ),
                  ExpansionTile(
                    initiallyExpanded: true,
                    leading: Icon(
                      Icons.local_activity,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: Text('More Attractions',
                        style: Theme.of(context).textTheme.bodyText1),
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.restaurant,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text('Restaurants',
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllRestaurants(
                                        themeData: state.themeData,
                                      )));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.local_cafe,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text('Cafe',
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllRestaurants(
                                        themeData: state.themeData,
                                        isWhat: 1,
                                      )));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.local_bar,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text('Pubs',
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllRestaurants(
                                        themeData: state.themeData,
                                        isWhat: 2,
                                      )));
                        },
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.local_hotel,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        title: Text('Hotels',
                            style: Theme.of(context).textTheme.bodyText1),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllHotels(
                                        themeData: state.themeData,
                                      )));
                        },
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutScreen(
                                    themeData: state.themeData,
                                  )));
                    },
                    title: Text('About this app',
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ],
              )),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Theme',
                      style: state.themeData.textTheme.bodyText1,
                    ),
                  ],
                ),
                subtitle: SizedBox(
                  height: 100,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: <Widget>[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 2, color: borders[index]),
                                        color: colors[index]),
                                  ),
                                ),
                                Text(themes[index],
                                    style: state.themeData.textTheme.bodyText1)
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        switch (index) {
                                          case 0:
                                            state.saveOptionValue(
                                                ThemeStateEnum.light);
                                            break;
                                          case 1:
                                            state.saveOptionValue(
                                                ThemeStateEnum.dark);
                                            break;
                                          case 2:
                                            state.saveOptionValue(
                                                ThemeStateEnum.amoled);

                                            break;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      child: state.themeData.primaryColor ==
                                              colors[index]
                                          ? Icon(Icons.done,
                                              color:
                                                  state.themeData.colorScheme.secondary)
                                          : Container(),
                                    ),
                                  ),
                                ),
                                Text(themes[index],
                                    style: state.themeData.textTheme.bodyText1)
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
