import 'package:flutter/material.dart';
import 'package:newbie/provider/light_dark_provider.dart';
import 'package:provider/provider.dart';

class LightDarkPage extends StatefulWidget {
  const LightDarkPage({Key? key}) : super(key: key);

  @override
  State<LightDarkPage> createState() => _LightDarkPageState();
}

class _LightDarkPageState extends State<LightDarkPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<LightDartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: theme.themeMode == ThemeMode.light ||
                theme.themeMode == ThemeMode.system
            ? Text('Light Mode')
            : Text('Dark Mode'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioListTile<ThemeMode>(
              title: Text('Light'),
              value: ThemeMode.light,
              groupValue: theme.themeMode,
              onChanged: theme.changeTheme),
          RadioListTile<ThemeMode>(
              title: Text('Dark'),
              value: ThemeMode.dark,
              groupValue: theme.themeMode,
              onChanged: theme.changeTheme),
          RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              value: ThemeMode.system,
              groupValue: theme.themeMode,
              onChanged: theme.changeTheme),
          Icon(
            Icons.favorite,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
