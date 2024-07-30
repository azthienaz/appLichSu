import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class KhucThuaMyPage extends StatefulWidget {
  const KhucThuaMyPage({super.key});
  @override
  _KhucThuaMyPageState createState() => _KhucThuaMyPageState();
}
class _KhucThuaMyPageState extends State<KhucThuaMyPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 27,
    image: AssetImage('assets/images/khucthuamy.png'),
    title: "Khúc Thừa Mỹ",
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
            'Khúc Thừa Mỹ',
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
              Image(image: AssetImage('assets/images/khucthuamy.png')),
              SizedBox(height: 8,),
              Text(
                "917 - 930",
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
                      'Cuối năm 917 khi Khúc Thừa Mỹ trở về thì Khúc Hạo mất. Khúc Thừa Mỹ lên thay cha làm Tiết độ sứ Tĩnh Hải quân. Ông không tiếp tục chính sách "khoan thứ sức dân" mà Khúc Hạo đã áp dụng. Nhân dân tại Tĩnh Hải quân phải lao dịch nặng nề, do đó sự ủng hộ với họ Khúc không còn được như trước. Về mặt đối ngoại, Khúc Thừa Mỹ chủ trương kết thân với nhà Hậu Lương ở Trung nguyên mà gây hấn với nước Nam Hán liền kề. Năm 919, ông sai sứ sang Biện Kinh xin tiết việt của nhà Hậu Lương. Vua Lương là Mạt đế Chu Hữu Trinh bấy giờ bận đối phó với các nước lớn ở Trung nguyên nên ban tiết việt cho Khúc Thừa Mỹ và phong ông làm Tiết độ sứ Giao châu. Do mất sự ủng hộ của nhân dân trong nước, nhà Hậu Lương thừa nhận ông cũng sắp bị diệt vong lại ở quá xa càng không thể hỗ trợ được gì, Khúc Thừa Mỹ đơn độc và bị thua trận. Ông bị quân Nam Hán bắt đưa về Phiên Ngung. Vua Hán cử Lý Tiến làm Thứ sử Giao châu.',
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
