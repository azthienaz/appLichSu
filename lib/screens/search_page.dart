import 'package:flutter/material.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/constant_screen/event_page.dart';
import 'package:applichsu/widgets/search.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/home_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  _SearchPageState createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage>{

  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
      searchData.clear();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  void onSelectSearchModel(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConstantEventPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)])),
        
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: (){
                searchData.clear();
                Navigator.of(context).pop();
              },
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: Text(
                'Trang kết quả tìm kiếm',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: searchData.isNotEmpty ?
              Column(
                children: [
                    Expanded(
                      child: GridView(
                        padding: const EdgeInsets.all(20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        children: [
                          for(final searchModel in searchData)
                            SearchWidget(
                              searchModel: searchModel,
                              onSelectSearchModel: onSelectSearchModel,
                            ),
                        ],
                      ),
                    ),
                ],
              )
            :
              const Center(
                child: Text(
                  '--- No exist article ---',
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 60, 60),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
        
          ),
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