import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:safir_challenge/provider/signin_provider.dart';
import 'package:safir_challenge/provider/signup_provider.dart';
import 'package:safir_challenge/r.dart';
import 'package:safir_challenge/strings/strings.dart';
import 'package:safir_challenge/ui/theme/app_txt_styles.dart';
import 'package:safir_challenge/ui/view/sign_up/sign_up_screen.dart';
import 'package:safir_challenge/utils.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: Utils.apiKey,
      appId: Utils.appIdAndroid,
      messagingSenderId: Utils.senderID,
      projectId: Utils.projectId,
    ),
  ).then((value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_)=> SignInProvider())
      ],
      child: const MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SignUpScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(R.assetsImgsSplashBg, fit: BoxFit.fitHeight),
        ),
        Container(
          color: Colors.blue.withOpacity(0.8),
        ),
        Center(
            child: Text(
          AppStrings.loading,
          style: AppTxtStyle.getAppMainTxtStyleWhiteColor(
              size: 20, fontWeight: FontWeight.w600),
        )),
      ],
    )));
  }
}
