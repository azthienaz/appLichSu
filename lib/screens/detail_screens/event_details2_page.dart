import 'package:applichsu/screens/constant_screens/video_page.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:applichsu/data/search_data.dart';

class EventDetails2Page extends StatefulWidget {
  const EventDetails2Page({super.key});
  @override
  _EventDetails2PageState createState() => _EventDetails2PageState();
}
class _EventDetails2PageState extends State<EventDetails2Page>{
  int _screenIndex = 1;
  static var bookmarked = false;
  var bm = const BookmarkModel(
    index: 12,
    image: AssetImage('assets/images/event2.png'),
    title: "Cuộc khởi nghĩa của Lý Bí (Lý Nam Đế) thắng lợi",
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
              const Image(image: AssetImage('assets/images/event2.png')),
              const SizedBox(height: 8,),
              const Text(
                "Cuộc khởi nghĩa của Lý Bí (Lý Nam Đế) thắng lợi",
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
                    "544 - 548",
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
                        MaterialPageRoute(builder: (context) => const VideoPage('assets/videos/event2.mp4')),
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
                      'Vào tháng 1 năm 542, Lý Bí dựng cờ khởi nghĩa tại Thái Bình (Sơn Tây). Cuộc khởi nghĩa của Lý Bí được sự ủng hộ của nhân dân khắp nơi, nhiều anh hùng hào kiệt đã tham gia vào nghĩa quân như Triệu Túc và Triệu Quang Phục ở Chu Diên, Phạm Tu ở Thanh Trì, Tinh Thiều ở Thái Bình, Lý Phục Man ở Cổ Sơ. Sau 3 tháng từ khi cuộc KN Lý Bí diễn ra, nghĩa quân đã giành được thắng lợi, chiếm được hầu hết các quận, huyện. Thứ sử Tiêu Tư của nhà Lương hoảng sợ, đã bỏ thành Long Biên (nay là Bắc Ninh) bỏ chạy về Trung Quốc. Tháng 4 năm 542, nhà Lương tăng cường huy động quân sang đàn áp cuộc khởi nghĩa của Lý Bí nhưng đã gặp phải thất bại, nghĩa quân anh dũng chiến đấu đánh đuổi được quân Lương và giải phóng được Hoàng Châu. Đầu năm 543, nhà Lương vẫn chưa từ bỏ ý định tiếp tục cho quân sang tấn công quân ta lần 2. Quân ta nghênh chiến và đánh địch tại Hợp Phố. Sau thời gian chống trả quyết liệt, quân ta cũng đã giành được thắng lợi, buộc nhà Lương phải rút quân. Khởi nghĩa Lý Bí có kết quả tốt đẹp.',
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
