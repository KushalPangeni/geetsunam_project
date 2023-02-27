import 'package:flutter/material.dart';
import 'package:geetsunam/controller/fetch_provider.dart';
import 'package:geetsunam/home_page.dart';
import 'package:geetsunam/model/player_separate.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  //creating PlayerSeparate Class as singleton by using GetIt package
  final GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton(() => PlayerSeparate());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final fetchProvider = Provider.of<FetchData>(context, listen: false);
    return ChangeNotifierProvider(
      create: (context) => FetchData(),
      child: const MaterialApp(
        home: Homepage(),
      ),
    );
  }
}
