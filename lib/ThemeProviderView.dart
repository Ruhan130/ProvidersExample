import 'package:flutter/material.dart';
import 'package:project/provider/themeProvider.dart';
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
        title: Text("Light And Dark Theme"),
      ),
      body: Column(
        children: [
          RadioListTile(
              title: const Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
          RadioListTile(
              title: const Text("System Mode"),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: themeChanger.setTheme),
        ],
      ),
    );
  }
}
