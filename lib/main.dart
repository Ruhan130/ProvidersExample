import 'package:flutter/material.dart';
import 'package:project/ThemeProviderView.dart';
import 'package:project/provider/CountProvider.dart';
import 'package:project/provider/ExampleOneProvider.dart';
import 'package:project/provider/themeProvider.dart';
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
              appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
            ),
            home: const Themeproviderview(),
          );
        }));
  }
}
