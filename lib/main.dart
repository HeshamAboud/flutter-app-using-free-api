import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:map_app/core/injection.dart';
import 'package:map_app/feture/posts_screen/bussiness_logic/posts_cubit.dart';
import 'package:map_app/theme/theme_state.dart';
import 'package:map_app/viwes/home_widgets.dart';
import 'package:map_app/viwes/list_of_posts.dart';
import 'package:map_app/viwes/on_bording.dart';
import 'package:map_app/viwes/profile_page.dart';
import 'package:map_app/viwes/setting_widgets.dart';
import 'package:map_app/viwes/simple_e_commerce_app.dart';
import 'package:map_app/viwes/sing_in_widget.dart';
import 'package:map_app/viwes/slider_in_flutter.dart';
import 'package:map_app/viwes/test.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'core/bloc_obsever.dart';
import 'feture/posts_screen/presentation/screen/list_of_posts_screen.dart';
import 'helper/cache_helper.dart';
import 'helper/dio_helper.dart';
import 'viwes/singel_page_cafe_widget.dart';

void main() {
   CacheHelper.init();

   Diohelper.init();

  Bloc.observer = MyBlocObserver();
  initGetIt();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'new app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      // home: SimpleEcommerce(),
      // home: CustomSlidersPage(),
      // home: BlocProvider.value(
      //   value: getIt<PostsCubit>(),
      //   child: HeroListPage(),
      // ),
      //  home: NewsFeedPage1(),
      //  home: ProfilePage1(),
      home: ConcentricAnimationOnboarding(),
      //  home: SettingsPage2(),
      //  home: MyHomePage(),
      //  home: GoogleBottomBar(),
      //  home: SignInPage2(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:provider/provider.dart';
//
// import 'screens/home.dart';
//
// void main() async {
//   await initHiveForFlutter();
//   final HttpLink httpLink = HttpLink("https://tourism-nepal.herokuapp.com/");
//   ValueNotifier<GraphQLClient> graphQlClient = ValueNotifier(
//     GraphQLClient(
//       link: httpLink,
//       cache: GraphQLCache(store: HiveStore()),
//     ),
//   );
//   runApp(GraphQLProvider(
//       client: graphQlClient,
//       child: ChangeNotifierProvider<ThemeState>(
//         create: (_) => ThemeState(),
//         child: MaterialApp(
//           title: 'Welcome to Nepal',
//           debugShowCheckedModeBanner: false,
//           home: HomePage(),
//         ),
//       )));
// }
