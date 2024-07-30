import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:applichsu/data/search_data.dart';

class MuseumDetails1Page extends StatefulWidget {
  const MuseumDetails1Page({super.key});
  @override
  _MuseumDetails1PageState createState() => _MuseumDetails1PageState();
}
class _MuseumDetails1PageState extends State<MuseumDetails1Page>{
  int _screenIndex = 3;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 1,
    image: AssetImage('assets/images/museum1.png'),
    title: "Trống đồng Cảnh Thịnh",
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
            'Bảo tàng lịch sử',
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
              Image(image: AssetImage('assets/images/museum1.png')),
              SizedBox(height: 8,),
              Text(
                "Trống đồng Cảnh Thịnh",
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
                      'Trống đồng Cảnh Thịnh được đúc theo kỹ thuật khuôn sáp, nặng 32 kg, cao 37,4 cm, đường kính khoảng 49 cm. Mặt trống cong vồng hình chỏm cầu, tâm mặt trống đúc nổihình vòng tròn kép. Thân trống hình trụ, phình nhẹ ở giữa, và được chia thành ba phần tương đối đều nhau, ngăn cách bằng hai đường gờ nổi hình sống trâu. Tương ứng với mỗi phần là một băng hoa văn trang trí. Ngoài các đồ án phụ trang trí đường diềm như băng hoa chanh, nhũ đinh, hồi văn chữ T và văn như ý, đề tài trang trí chủ đạo trên trống xuất hiện ở hai băng: băng trên cùng đúc nổi đề tài Tứ linh (Long, Lân, Quy, Phượng) mang ý nghĩa biểu trưng cho đất nước thái bình thịnh trị, xã hội an lạc, mưa thuận gió hòa, mùa màng tốt tươi, con người được no đủ, sống lâu… Băng dưới cùng trang trí hình Long Mã cõng Hà đồ, Thần Quy chở Lạc thư. Hà đồ (Tiên thiên bát quái đồ) và Lạc thư (Hậu thiên bát quái đồ) là hai biểu tượng khởi nguyên của Kinh Dịch – tư tưởng triết học của người Á Đông về quy luật của sự biến đổi.',
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
