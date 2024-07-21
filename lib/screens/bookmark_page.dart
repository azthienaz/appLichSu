import 'package:flutter/material.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/constant_screen/anecdote_page.dart';
import 'package:applichsu/widgets/bookmark.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/home_page.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}
class _BookmarkPageState extends State<BookmarkPage>{

  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  void onSelectBookmarkModel(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConstantAnecdotePage()),
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
            title: const Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: Text(
                'Bài đánh dấu',
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
            child: bookmarkData.isNotEmpty ?
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
                          for(final bookmarkModel in bookmarkData)
                            BookmarkWidget(
                              bookmarkModel: bookmarkModel,
                              onSelectBookmarkModel: onSelectBookmarkModel,
                            ),
                        ],
                      ),
                    ),
                ],
              )
            :
              const Center(
                child: Text(
                  '--- Empty ---',
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