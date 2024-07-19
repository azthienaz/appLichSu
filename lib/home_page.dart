import 'package:flutter/material.dart';
import 'screens/period_page.dart';
import 'screens/event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  int _screenIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey);
  static const List<Widget> _widgetOptions = <Widget>[
    PeriodPage(),
    EventPage(),
    Text(
      'Index 2: GiaiThoai',
      style: optionStyle
    ),
    Text(
      'Index 3: BaoTang',
      style: optionStyle
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _screenIndex = index;
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
            _widgetOptions.elementAt(_screenIndex),
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
              currentIndex: _screenIndex,
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle: const TextStyle
                (
                  color: Colors.grey, 
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
