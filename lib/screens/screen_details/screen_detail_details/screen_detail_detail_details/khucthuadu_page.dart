import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class KhucThuaDuPage extends StatefulWidget {
  const KhucThuaDuPage({super.key});
  @override
  _KhucThuaDuPageState createState() => _KhucThuaDuPageState();
}
class _KhucThuaDuPageState extends State<KhucThuaDuPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 26,
    image: AssetImage('assets/images/khucthuadu.png'),
    title: "Khúc Thừa Dụ",
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
            'Khúc Thừa Dụ',
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
              Image(image: AssetImage('assets/images/khucthuadu.png')),
              SizedBox(height: 8,),
              Text(
                "905 - 907",
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
                      'Năm 905, ở Tĩnh Hải quân (tên gọi Việt Nam lúc đó), Tiết độ sứ Độc Cô Tổn mới sang đã rất độc ác mất lòng người, bị gọi là "Ngục Thượng thư" (thượng thư ác). Tổn lại không cùng phe với Chu Ôn nên chỉ vài tháng lại bị Chu Ôn dời tiếp ra đảo Hải Nam và giết. Tĩnh Hải quân do đó không có người cai quản. Khúc Thừa Dụ, khi đó là Hào trưởng Chu Diên[1], được dân chúng ủng hộ, đã tiến ra chiếm đóng phủ thành Đại La (Tống Bình cũ - Hà Nội), tự xưng là Tiết độ sứ. Sau khi đã nắm được quyền lực thực tế trên đất Tĩnh Hải quân, ông đã cho xây dựng chính quyền dựa trên danh xưng của chính quyền đô hộ nhà Đường, nhưng thực chất là một chính quyền độc lập và do người Việt quản lý. Ông khéo léo dùng danh nghĩa "xin mệnh nhà Đường" buộc triều đình nhà Đường phải công nhận chính quyền của ông. Ngày 7 tháng 2 năm 906, vua Đường phong thêm cho Tĩnh Hải quân Tiết độ sứ Khúc Thừa Dụ tước "Đồng bình chương sự". Sau đó, Khúc Thừa Dụ tự lấy quyền mình, phong cho con là Khúc Hạo chức vụ "Tĩnh Hải hành quân tư mã quyền tri lưu hậu", tức là chức vụ chỉ huy quân đội và sẽ kế vị quyền Tiết độ sứ.',
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
