import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'diary_service.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // sharedPreferences 인스턴스 불러오기
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await initializeDateFormatting();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => DiaryService(prefs),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
