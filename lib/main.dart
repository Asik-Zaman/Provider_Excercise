import 'package:flutter/material.dart';
import 'package:newbie/pages/favorite.dart';
import 'package:newbie/pages/light_dark_page.dart';
import 'package:newbie/pages/login_page_with_provder.dart';
import 'package:newbie/pages/slider_page.dart';
import 'package:newbie/pages/text_form_toggle.dart';
import 'package:newbie/provider/auth_provider.dart';
import 'package:newbie/provider/counter_pvider.dart';
import 'package:newbie/provider/favourite_pvider.dart';
import 'package:newbie/provider/light_dark_provider.dart';
import 'package:newbie/provider/slider_pvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SliderProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CounterProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => LightDartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => AuthProvider(),
          ),
        ],
        child: Builder(
          builder: (context) {
            final theme = Provider.of<LightDartProvider>(context);
            return MaterialApp(
              themeMode: theme.themeMode,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.pink,
                primaryColor: Colors.green,
              ),
              darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  appBarTheme: AppBarTheme(color: Colors.teal)),
              home: LoginPage(),
            );
          },
        ));
  }
}
