import 'package:flutter/material.dart';
import 'package:project/ApiCallUsingProviderView/getApi.dart';
import 'package:project/provider/AuthProvider.dart';
import 'package:project/provider/CountProvider.dart';
import 'package:project/provider/ExampleOneProvider.dart';
import 'package:project/lightAndDarkTheme/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Countprovider(),
          ),
          ChangeNotifierProvider(
            create: (_) => Exampleoneprovider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ThemeChanger(),
          ),
          ChangeNotifierProvider(
            create: (_) => Authprovider(),
          ),
        ],
        child: Builder(builder: (BuildContext context) {
          final provider = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: provider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blue,
               primaryColor: Colors.black,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.white,
              primarySwatch: Colors.blue, 
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
            ),
            home: const Getapi(),
          );
        }));
  }
}
