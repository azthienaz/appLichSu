import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class ThoiTuyPage extends StatefulWidget {
  const ThoiTuyPage({super.key});
  @override
  _ThoiTuyPageState createState() => _ThoiTuyPageState();
}
class _ThoiTuyPageState extends State<ThoiTuyPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 44,
    image: AssetImage('assets/images/thoituy.png'),
    title: "Thời Tùy",
  );

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

  void _bookmarked(BookmarkModel bm){
    setState(() {
      bookmarked = !bookmarked;
    });
    final exited = bookmarkData.contains(bm);
    if(exited){
      bookmarkData.remove(bm);
    }
    else{
      bookmarkData.add(bm);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Thời Tùy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              alignment: Alignment.topRight,
              onPressed: () {
                _bookmarked(bm);
              },
              icon: bookmarked ? 
                const Icon(
                  Icons.favorite, color: Colors.red,
                )
                : 
                const Icon(
                  Icons.favorite_border, color: Colors.black,
                ),
            ),
          ],
        ),
        body: 
          const Column(
            children: [
              Image(image: AssetImage('assets/images/thoituy.png')),
              SizedBox(height: 8,),
              Text(
                "602 - 622",
                textAlign: TextAlign.left,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8,),
              Divider(
                color: Colors.grey,
                thickness: 2,
                height: 16,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Về danh nghĩa, Giao Châu cũng như các quận khác của nhà Tùy, trực tiếp phụ thuộc chính quyền trung ương. Nhưng trên thực tế, như lời thú nhận của vua Tùy Văn Đế, châu Giao chỉ là đất "ràng buộc lỏng lẻo". Cuối thời nhà Tùy, do loạn lạc, các quan cai trị ở Giao Châu cũng cát cứ ly khai với chính quyền trung ương. Khi Tùy Dạng Đế chết, Thái thú Khâu Hòa không biết. Khâu Hòa bóc lột nhân dân địa phương rất nặng, nhà cửa giàu có ngang với vương giả. Thái thú Cửu Chân là Lê Ngọc (vợ là người Việt) cùng các con xây thành lũy kháng cự nhà Đường mới thay nhà Tùy. Sau Khâu Hòa, tới năm 622, Lê Ngọc cùng Thái thú Nhật Nam là Lý Giáo cũng quy phục nhà Đường.',
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
              currentIndex: _screenIndex,
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
