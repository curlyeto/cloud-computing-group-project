import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_news/get_it.dart';
import 'package:space_news/view/blogpage.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavPage(),
    BlogPage(),
    ReportPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_open_outlined),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}