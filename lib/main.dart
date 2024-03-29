import 'package:flutter/material.dart';
import 'package:drb/landing_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences clearAll = await SharedPreferences.getInstance();
  // clearAll.clear();

  //To initilaized the localization for the hole app.
  // await EasyLocalization.ensureInitialized();

  runApp(
    //This widget is used to declare the language that will be used in app.!
    // EasyLocalization(
    //   path: 'assets/translations',
    //   supportedLocales: const [
    //     Locale('en'),
    //     Locale('ar'),
    //   ],
    //If non of the listed language is shown be default will show English
    // fallbackLocale: Locale('en'),
    //To load the translation language file.!
    // assetLoader: CodegenLoader(),
    //   child:
    const MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drb',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // supportedLocaleshryatvvaontext.supportedLocales,
      // localizationsDelegates: context.localizationDelegates,
      // locale: context.locale,
      home: LandingPage(),
    );
  }
}
