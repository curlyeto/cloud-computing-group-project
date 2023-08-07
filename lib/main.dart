import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/view/auth/landingpage.dart';
import 'package:space_news/view/auth/login.dart';
import 'package:space_news/view/blogpage.dart';
import 'package:space_news/view/buttomNavigationBar.dart';
import 'package:space_news/view/favpage.dart';
import 'package:space_news/view/homepage.dart';
import 'package:space_news/view/profilepage.dart';
import 'package:space_news/view/reportpage.dart';
import 'package:space_news/viewmodel/blogviewmodel.dart';
import 'package:space_news/viewmodel/homeviewmodel.dart';
import 'package:space_news/viewmodel/reportviewmodel.dart';


/// Flutter code sample for [BottomNavigationBar].

// void main() => runApp(
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
//     const BottomNavigationBarExampleApp());
void main() async{
  setuplocater();
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeViewModel>( create:(context)=>HomeViewModel(),),
          ChangeNotifierProvider<BlogViewModel>( create:(context)=>BlogViewModel(),),
          ChangeNotifierProvider<ReportViewModel>( create:(context)=>ReportViewModel(),),
        ],
        child: const BottomNavigationBarExampleApp(),
      )
  );
}
class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      home: LandingPage(),
    );
  }
}

