import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class KhucHaoPage extends StatefulWidget {
  const KhucHaoPage({super.key});
  @override
  _KhucHaoPageState createState() => _KhucHaoPageState();
}
class _KhucHaoPageState extends State<KhucHaoPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    image: AssetImage('assets/images/khuchao.png'),
    title: "Khúc Hạo",
  );

  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
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
            'Khúc Hạo',
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
              Image(image: AssetImage('assets/images/khuchao.png')),
              SizedBox(height: 8,),
              Text(
                "907 - 917",
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
                      'Ngày 23 tháng 7 năm 907, Khúc Thừa Dụ mất, Khúc Hạo lên kế vị và phong cho con là Khúc Thừa Mỹ[3] làm "Tĩnh Hải hành quân tư mã quyền tri lưu hậu" để kế vị. Nhà Hậu Lương lên thay nhà Đường công nhận ông làm "An Nam đô hộ, sung Tiết độ sứ". Khúc Hạo là nhà cai trị ôn hoà nhưng rất vững vàng. Khúc Hạo đã tiến hành cải cách quan trọng về các mặt. Đường lối chính trị của ông được sử sách tóm lược ngắn gọn song rất rõ ràng: "Chính sự cốt chuộng khoan dung, giản dị, nhân dân đều được yên vui". Khúc Hạo sửa lại chế độ điền tô, thuế má lực dịch nặng nề của thời thuộc Đường. Ông ra lệnh "bình quân thuế ruộng, tha bỏ lực dịch, lập sổ hộ khẩu, kê rõ quê quán, giao cho giáp trưởng (quản giáp) trông coi". Khúc Hạo đã có những cố gắng đầu tiên nhằm xây dựng chính quyền độc lập, thống nhất từ trung ương đến xã. Ông chia cả nước thành những đơn vị hành chính các cấp: lộ, phủ, châu, giáp, xã. Mỗi xã đặt ra xã quan, một người chánh lệnh trưởng và một người tá lệnh trưởng.',
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
