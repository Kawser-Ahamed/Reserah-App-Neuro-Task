import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:research_app/firebase_options.dart';
import 'package:research_app/pages/homepage.dart';
import 'package:research_app/pages/memory_test1.dart';
import 'package:research_app/routes/route.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2220),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
           //home: GyroscopePage(),
          initialRoute: MyRoute.homePage,
          routes: {
            MyRoute.homePage : (context) => const HomePage(),
            MyRoute.memoryTest1 : (context) => const MemoryTest1(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}