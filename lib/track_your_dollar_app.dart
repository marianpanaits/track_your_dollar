import 'package:flutter/material.dart';
import 'package:track_your_dollar/generated/l10n.dart';
import 'package:track_your_dollar/main_page.dart';
import 'package:track_your_dollar/theme.dart';

class TrackYourDollarApp extends StatelessWidget {
  const TrackYourDollarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track your dollar',
      theme: myTheme,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
      ],
      home: const MainPage(),
    );
  }
}
