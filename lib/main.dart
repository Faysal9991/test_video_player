import 'package:flutter/material.dart';
import 'package:flutter_test_2/provider/video_provider.dart';
import 'package:flutter_test_2/screens/home/home_screen.dart';
import 'package:flutter_test_2/util/helper.dart';
import 'package:flutter_test_2/util/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => di.sl<VideoProvider>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Helper.navigatorKey,
      title: 'Flutter Demo',
      theme: AppTheme.getLightModeTheme(),
      home: const HomeScreen(),
    );
  }
}
