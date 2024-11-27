import 'package:flutter/material.dart';
import 'package:project/lightAndDarkTheme/ScreenOne.dart';
import 'package:project/lightAndDarkTheme/themeProvider.dart';
import 'package:provider/provider.dart';

class Themeproviderview extends StatefulWidget {
  const Themeproviderview({super.key});

  @override
  State<Themeproviderview> createState() => _ThemeproviderviewState();
}

class _ThemeproviderviewState extends State<Themeproviderview> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Light And Dark Theme"),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: const Text(
                "Light Mode",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text(
                "Dark Mode",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          Container(
            margin: const EdgeInsets.all(10),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[400]),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Screenone(),
                      ));
                },
                child:  Text(
                  "Go Screen to other screen",
                  style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}
