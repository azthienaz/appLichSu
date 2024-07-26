import 'package:applichsu/constant_screen/video_page.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:applichsu/data/search_data.dart';

class EventDetailsHVPage extends StatefulWidget {
  const EventDetailsHVPage({super.key});
  @override
  _EventDetailsHVPageState createState() => _EventDetailsHVPageState();
}
class _EventDetailsHVPageState extends State<EventDetailsHVPage>{
  int _screenIndex = 1;
  static var bookmarked = false;
  var bm = const BookmarkModel(
    image: AssetImage('assets/images/hungvuong.png'),
    title: "Giỗ Tổ Hùng Vương",
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
            'Sự kiện lịch sử',
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
          Column(
            children: [
              const Image(image: AssetImage('assets/images/hungvuong.png')),
              const SizedBox(height: 8,),
              const Text(
                "Giỗ Tổ Hùng Vương",
                textAlign: TextAlign.left,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 221, 156, 58),
                      textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      
                    ),
                    child: const Text('Xem video', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConstantVideoPage()),
                      );
                    }, 
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Colors.grey,
                thickness: 2,
                height: 16,
                indent: 5,
                endIndent: 5,
              ),
              const SizedBox(height: 5),
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Theo Ngọc phả Hùng Vương chép thời Hồng Đức hậu Lê thì từ thời nhà Tiền Lê, nhà Lý, nhà Trần rồi đến Hậu Lê các vua và nhân dân địa phương đều đến lễ bái các vua Hùng.[2] Từ thời xưa, các triều đại quân chủ và phong kiến Việt Nam đã quản lý Đền Hùng theo cách giao thẳng cho dân sở tại trông nom, sửa chữa, cúng bái, tổ chức ngày giỗ Hùng Vương thứ 18 vào ngày 11 tháng 3 âm lịch; đổi lại dân địa phương được triều đình miễn cho những khoản thuế ruộng cùng sưu dịch và sung vào lính. Sang thế kỷ 20, năm 1917 triều vua Khải Định, Bộ Lễ chính thức gửi công văn ghi ngày 25 tháng 7 phái quan hàng tỉnh của tỉnh Phú Thọ lấy ngày mồng 10 tháng 3 âm lịch thì cử hành "quốc tế" hàng năm, tức là sức cho các quan phải mặc phẩm phục lên đền Hùng thay mặt triều đình Huế cúng tế. Bia Hùng Vương từ khảo tại đền Thượng do Tham tri, Hữu tuần phủ Phú Thọ là Bùi Ngọc Hoàn soạn, cho biết: “Năm Khải Định thứ hai, tức năm 1917 lịch dương, Tuần phủ Phú Thọ là Lê Trung Ngọc có công văn xin Bộ Lễ ấn định lấy ngày mồng 10 tháng 3 hàng năm làm ngày Quốc tế, tức trước ngày giỗ Hùng Vương thứ 18 một ngày, ngày 11 tháng 3, do dân sở tại cúng tế”. Đây cũng là cứ liệu xác tín nhất để xác định rõ ràng ngày lễ chính thức Giỗ Tổ Hùng Vương 10 tháng Ba âm lịch chỉ được ban hành từ hoàng triều Khải Định. Ngày 10 tháng Ba từ đó được dùng cho toàn quốc. Sau khi nền cộng hòa thành lập, chính phủ Việt Nam Dân chủ Cộng hòa ra Sắc lệnh, xem ngày 10 tháng Ba là một trong những ngày lễ chính thức của quốc gia, các công chức được nghỉ lễ có hưởng lương. Trong lễ Giỗ Tổ năm Bính Tuất (ngày 11 tháng 4 năm 1946), Chủ tịch Hồ Chí Minh dự Lễ giỗ Tổ Hùng Vương tại Việt Nam học xá (nay là khu vực Trường Đại học bách khoa Hà Nội). Cũng trong ngày này, thừa ủy quyền Chủ tịch Chính phủ, Bộ trưởng Nội vụ Huỳnh Thúc Kháng thay mặt Chính phủ lên làm lễ dâng hương tại Đền Hùng, đã dâng 1 tấm bản đồ Tổ quốc Việt Nam và 1 thanh gươm quý nhằm tế cáo với Tổ tiên về đất nước đang bị Pháp xâm lăng và cầu mong Tổ tiên phù hộ cho quốc thái dân an, thiên hạ thái bình cùng nhau đoàn kết, đánh tan giặc xâm lược, bảo vệ toàn vẹn lãnh thổ của đất nước.',
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
