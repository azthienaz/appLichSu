import 'package:flutter/material.dart';
import 'screens/main_screens/period_page.dart';
import 'screens/main_screens/event_page.dart';
import 'screens/main_screens/anecdote_page.dart';
import 'screens/main_screens/museum_page.dart';
import 'constants/screen_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  static const List<Widget> _widgetOptions = <Widget>[
    PeriodPage(),
    EventPage(),
    AnecdotePage(),
    MuseumPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return
      Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 228, 160, 59), Colors.white])
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body:  
            _widgetOptions.elementAt(ScreenIndex.screenIndex),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.public),
                  label: 'Thời kỳ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.description),
                  label: 'Sự kiện',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Giai thoại',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.museum),
                  label: 'Bảo tàng',
                ),
              ],
              currentIndex: ScreenIndex.screenIndex,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle(
                color: Colors.grey, 
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              selectedLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 228, 160, 59), 
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              selectedItemColor: const Color.fromARGB(255, 228, 160, 59),
              onTap: _onItemTapped,
            ),
        ),
      );
  }
}
