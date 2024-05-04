import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:track_your_dollar/injection/injection_container.dart' as di;
import 'package:track_your_dollar/track_your_dollar_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();

  runApp(const TrackYourDollarApp());
}
