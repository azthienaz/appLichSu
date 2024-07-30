import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class VanLangPage extends StatefulWidget {
  const VanLangPage({super.key});
  @override
  _VanLangPageState createState() => _VanLangPageState();
}
class _VanLangPageState extends State<VanLangPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 48,
    image: AssetImage('assets/images/vanlang.png'),
    title: "Nước Văn Lang",
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
            'Nước Văn Lang',
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
              Image(image: AssetImage('assets/images/vanlang.png')),
              SizedBox(height: 8,),
              Text(
                "Thế kỷ VII TCN - 258 TCN",
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
                      'Kinh Dương Vương làm Vua vào khoảng năm Nhâm Tuất (hơn 2000 năm trước Công nguyên). Kinh Dương Vương lấy con gái Thần Long là Vua hồ Động Đình sinh một con trai đặt tên là Sùng Lãm, sau nối ngôi vua cha niên hiệu là Lạc Long Quân. Lạc Long Quân lấy con gái Đế Lai là Âu Cơ sinh ra một bọc một trăm trứng, một trăm trứng nở ra một trăm người con trai là tổ tiên của người Bách Việt. Một hôm nhà Vua bảo bà Âu Cơ: "Ta là giống Rồng, nàng là giống Tiên, thủy hỏa khắc nhau, chung hợp thật khó". Bèn từ biệt, chia năm chục người con theo mẹ lên núi , năm chục người con theo cha về phía Nam miền biển, phong cho con trưởng làm Hùng Vương nối ngôi. Hùng Vương lên ngôi Vua, đặt quốc hiệu là Văn Lang, đóng đô ở Phong Châu (Bạch Hạc, Phú Thọ), chia nước ra làm 15 bộ. Các đời Vua sau đều gọi là Hùng Vương, có 18 đời vua Hùng Vương(*) . Đặt các tướng văn gọi là Lạc Hầu, tướng võ gọi là Lạc Tướng, con trai vua gọi là Quan Lang, con gái Vua gọi là Mỵ Nương, các quan nhỏ gọi là Bồ Chính. Nhà nước Văn Lang của các Vua Hùng là nhà nước phôi thai đầu tiên của Việt Nam, còn rất đơn giản, mặc dù mới hình thành nhưng đã cố kết được lòng người. Từ tình cảm cộng đồng dẫn đến ý thức cộng đồng, thể hiện rõ tình đồng bào ruột thịt. Họ bước đầu hiểu được mối quan hệ giữa thiên nhiên và con người, thấy được sức mạnh của cộng đồng trong việc làm thủy lợi, trao đổi sản phẩm và đấu tranh giữ gìn bản làng, đất nước.',
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
