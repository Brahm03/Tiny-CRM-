import 'package:crm/provider/FormProvider.dart';
import 'package:crm/provider/boxProvider.dart';
import 'package:crm/screens/homePage.dart';
import 'package:crm/service/boxService.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  await Boxservice.makeBox();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => BoxProvider(),
    ),
    ChangeNotifierProvider(create: (_) => FormProvider())
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
