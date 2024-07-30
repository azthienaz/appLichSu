import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class TrieuVietVuongPage extends StatefulWidget {
  const TrieuVietVuongPage({super.key});
  @override
  _TrieuVietVuongPageState createState() => _TrieuVietVuongPageState();
}
class _TrieuVietVuongPageState extends State<TrieuVietVuongPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 46,
    image: AssetImage('assets/images/trieuvietvuong.png'),
    title: "Triệu Việt Vương đánh đuổi quân Lương",
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
            'Triệu Việt Vương đánh đuổi quân Lương',
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
              Image(image: AssetImage('assets/images/trieuvietvuong.png')),
              SizedBox(height: 8,),
              Text(
                "546 - 550",
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
                      'Tháng 3 năm 548, nghe tin Lý Nam Đế mất trong động Khuất Lão, Triệu Quang Phục tự xưng là Triệu Việt Vương. Trần Bá Tiên vây đánh nhiều lần không được. Lý Thiên Bảo thấy động Dã Năng ở đầu nguồn Đào Giang, đất phẳng rộng màu mỡ có thể ở được, Lý Thiên Bảo mới đắp thành để ở, nhân tên đất ấy mà đặt quốc hiệu. Đến bây giờ quân chúng tôn làm chúa, xưng là Đào Lang vương. Tháng 1 năm 550, nhà Lương cho Trần Bá Tiên làm Uy minh tướng quân Giao Châu thứ sử. Bá Tiên lại mưu tính cầm cự lâu ngày khiến cho Triệu Việt Vương lương hết quân mỏi thì có thể phá được. Gặp lúc bên nước Lương xảy ra loạn Hầu Cảnh, nhà Lương gọi Bá Tiên về, ủy quyền cho tì tướng là Dương Sàn cầm quân. Triệu Việt Vương nhân lúc quân Lương không còn tướng giỏi, tung quân ra đánh. Sàn mang quân chống cự, bị thua chết. Quân Lương tan vỡ chạy về Bắc. Triệu Việt Vương lấy lại được nước Vạn Xuân, đóng đô ở thành Long Biên.',
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
