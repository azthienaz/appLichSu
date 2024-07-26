import 'package:applichsu/constant_screen/video_page.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:applichsu/data/search_data.dart';

class EventDetails3Page extends StatefulWidget {
  const EventDetails3Page({super.key});
  @override
  _EventDetails3PageState createState() => _EventDetails3PageState();
}
class _EventDetails3PageState extends State<EventDetails3Page>{
  int _screenIndex = 1;
  static var bookmarked = false;
  var bm = const BookmarkModel(
    index: 13,
    image: AssetImage('assets/images/event3.png'),
    title: "Triệu Quang Phục tiếp tục kháng chiến chống quân Lương",
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
              const Image(image: AssetImage('assets/images/event3.png')),
              const SizedBox(height: 8,),
              const Text(
                "Triệu Quang Phục tiếp tục kháng chiến chống quân Lương",
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
                    "548 - 571",
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
                      'Tháng 5 năm 545, quân Lương do Dương Phiêu và Trần Bá Tiên[2] chỉ huy lại sang đánh Vạn Xuân. Lý Nam Đế giao chiến bất lợi. Năm 546, sau khi thua trận phải lui về động Khuất Lão, Lý Nam Đế đã ủy thác cho ông giữ việc nước, điều quân đi đánh Trần Bá Tiên của nhà Lương. Năm 547, tháng Giêng, ông lui về giữ đầm Dạ Trạch (bãi Màn Trò, huyện Khoái Châu, tỉnh Hưng Yên). Đầm này rộng, cỏ cây um tùm, bụi rậm che kín, ở giữa có nền đất cao có thể ở được, bốn mặt bùn lầy, người ngựa khó đi, chỉ dùng thuyền độc mộc nhỏ chống sào đi lướt trên cỏ nước mới có thể vào được. Nếu không quen biết đường đi thì lạc không biết là đâu, lỡ rơi xuống nước liền bị rắn độc cắn chết. Quang Phục thuộc rõ đường đi lối lại, đem hơn hai vạn người vào đóng ở nền đất trong đầm. Ông dùng chiến thuật du kích, ban ngày tuyệt không để khói lửa và dấu người, ban đêm dùng thuyền độc mộc đem quân ra đánh doanh trại của quân Bá Tiên cướp lương thực vũ khí, giết và bắt sống rất nhiều, lấy được lương thực để làm kế cầm cự lâu dài. Bá Tiên không đánh được. Người trong nước gọi ông là Dạ Trạch Vương. Sau khi nghe tin Lý Nam Đế mất ở động Khuất Lão, Triệu Quang Phục tự xưng là Triệu Việt Vương. Năm 550, Trần Bá Tiên mưu tính cầm cự lâu ngày để làm cho quân của ông lương hết, quân mệt mỏi thì có thể phá được. Gặp lúc nhà Lương có loạn Hầu Cảnh, gọi Trần Bá Tiên về (sau này Trần Bá Tiên cướp ngôi vua của nhà Lương năm 557), ủy cho tì tướng là Dương Sàn ở lại. Ông tung quân ra đánh. Giặc chống cự, thua chết. Quân Lương tan vỡ chạy về bắc.',
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
