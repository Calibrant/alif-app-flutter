import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_alif/provider/todos.dart';
import 'package:flutter_app_alif/screen/todo_screen.dart';
import 'package:flutter_app_alif/utilities/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosProvider>(
      create: (context) => TodosProvider(),
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.light,
        light: kLightTheme,
        dark: kDarkTheme,
        builder: (light, dark) => MaterialApp(
          theme: light,
          darkTheme: dark,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: ToDoScreen(),
        ),
      ),
    );
  }
}
