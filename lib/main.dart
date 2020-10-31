import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/views/settings.dart';
import 'package:myapp/views/account.dart';
import 'package:myapp/views/error_page.dart';
import 'package:myapp/views/home.dart';

import 'views/authenticate.dart';

/// App Root
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;
  @override
  void initState() {
    //getLoggedInState();
    super.initState();
    WidgetsBinding.instance.renderView.automaticSystemUiAdjustment =
        false; //<--
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF1f1e30),
        systemNavigationBarColor: Color(0xFF1f1e30),
      ),
    );
  }

  // getLoggedInState() async {
  //   await HelperFunctions.getUserLoggedInPreference().then((value) {
  //     setState(() {
  //       userIsLoggedIn = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "Flutter Medical",
      debugShowCheckedModeBanner: false,
      // home: userIsLoggedIn != null
      //     ? userIsLoggedIn
      //         ? HomeScreen()
      //         : Authenticate()
      // : Container(
      //     child: Center(
      //       child: Authenticate(),
      //     ),
      //   ),
      home: HomeScreen(),
      theme: ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
            // border: OutlineInputBorder(),
            ),
      ),
    );
  }
}
