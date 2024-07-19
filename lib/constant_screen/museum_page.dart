import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';

class ConstantMuseumPage extends StatefulWidget {
  const ConstantMuseumPage({super.key});
  @override
  _ConstantMuseumPageState createState() => _ConstantMuseumPageState();
}
class _ConstantMuseumPageState extends State<ConstantMuseumPage>{
  int _screenIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }
  static var bookmarked = false;
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Bảo tàng lịch sử',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 25),
              IconButton(
                alignment: Alignment.topRight,
                onPressed: () {
                  setState(() {
                    bookmarked = !bookmarked;
                  });
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
        ),
        body: 
          const Column(
            children: [
              Image(image: AssetImage('assets/images/museum6.png')),
              SizedBox(height: 8,),
              Text(
                "Ấn vàng Sắc mệnh chi bảo",
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
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Ngoài ra còn nhiều hiện vật khác như: Ấn đồng Môn hạ Sảnh ấn, thời Tần, niên hiệu Long Khánh thứ 5(1377); bình vẽ thiên nga bằng gốm hoa lam, thời Lê Sơ, thế kỷ 15; bia điện Nam Giao bằng đá, thời Lê Trung hưng, năm Vĩnh Trị 4 (1679), trống Cảnh Thịnh bằng đồng, thời Tây Sơn, niên hiệu Cảnh Thịnh năm 1800, ấn Sắc mệnh chi bảo bằng vàng, thời Nguyễn, năm Minh Mệnh thứ 8 (1827); tập thơ Nhật ký trong tù của Hồ Chí Minh; sách Đường Kách mệnh của Nguyễn Ái Quốc; bản thảo Lời kêu gọi toàn quốc kháng chiến của chủ tịch Hồ Chí Minh',
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
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
