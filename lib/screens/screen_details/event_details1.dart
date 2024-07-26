import 'package:applichsu/constant_screen/video_page.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:applichsu/data/search_data.dart';

class EventDetails1Page extends StatefulWidget {
  const EventDetails1Page({super.key});
  @override
  _EventDetails1PageState createState() => _EventDetails1PageState();
}
class _EventDetails1PageState extends State<EventDetails1Page>{
  int _screenIndex = 1;
  static var bookmarked = false;
  var bm = const BookmarkModel(
    index: 11,
    image: AssetImage('assets/images/event1.png'),
    title: "Cuộc khởi nghĩa của Hai Bà Trưng giành thắng lợi",
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
              const Image(image: AssetImage('assets/images/event1.png')),
              const SizedBox(height: 8,),
              const Text(
                "Cuộc khởi nghĩa của Hai Bà Trưng giành thắng lợi",
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
                    "40 - 43",
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
                      'Bấy giờ ở huyện Mê Linh (vùng đất từ Ba Vì đến Tam Đảo, nay thuộc Hà Nội, Vĩnh Phúc), có hai chị em Trưng Trắc và Trưng Nhị là con gái của Lạc tướng thuộc dòng dõi Hùng Vương. Chồng bà Trưng Trắc là Thi Sách - con trai của Lạc tướng huyện Chu Diên (vùng Đan Phượng và Từ Liêm, Hà Nội ngày nay). Gia đình của Thi Sách là một gia đình yêu nước và có thế lực ở vùng đất Chu Diên. Bất bình trước chế độ cai trị hà khắc của chính quyền nhà Hán, hai gia đình Lạc tướng cùng nhau lập mưu đánh đổ ách thống trị của nhà Hán để giành lại độc lập cho dân tộc. Họ bí mật tìm cách liên kết với các thủ lĩnh ở mọi miền đất nước để chuẩn bị nổi dậy nhưng không may, Thi Sách đã bị quân Hán giết hại với mục đích làm giảm thế lực đối địch với chính quyền đô hộ, đồng thời đe dọa nhân dân ta, dập tắt ý định chống đối của các thủ lĩnh. Tuy nhiên điều này không những không dập tắt được ý định nổi dậy của dân ta mà còn làm tinh thần tiến hành khởi nghĩa của nhân dân ta đạt đến đỉnh điểm. Mùa xuân năm 40 (khoảng tháng 3 dương lịch), Hai Bà Trưng dựng cờ khởi nghĩa ở Hát Môn (Hà Nội). Tương truyền, vào ngày xuất quân, bà Trưng Trắc trên dàn thề trước ba quân đã đặt nợ nước lên trên thù chồng, bà đọc lời thề, sau này được viết thành 4 câu thơ như sau: "Một xin rửa sạch nước thù, Hai xin đem lại nghiệp xưa họ Hùng, Ba kẻo oan ức lòng chồng, Bốn xin vẹn vẹn sở công lênh này". Được nhân dân khắp nơi ủng hộ và hưởng ứng, nghĩa quân của Hai Bà Trưng đi đến đâu, chính quyền và quân đội nhà Đông Hán tan vỡ đến đấy. Tô Định hoảng hốt phải bỏ thành, cắt tóc, cạo râu, lẻn trốn về Nam Hải (Quảng Đông - Trung Quốc). Bọn Thứ sử, Thái thú khác của nhà Đông Hán thấy nghĩa quân nổi lên như vũ bão thì cũng đều hoảng sợ và theo nhau bỏ chạy về Trung Quốc.',
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
