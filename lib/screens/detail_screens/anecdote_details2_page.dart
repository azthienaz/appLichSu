import 'package:applichsu/screens/constant_screens/video_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';

class AnecdoteDetails2Page extends StatefulWidget {
  const AnecdoteDetails2Page({super.key});
  @override
  _AnecdoteDetails2PageState createState() => _AnecdoteDetails2PageState();
}
class _AnecdoteDetails2PageState extends State<AnecdoteDetails2Page>{
  int _screenIndex = 2;
  var bm = const BookmarkModel(
    index: 8,
    image: AssetImage('assets/images/anecdote2.png'),
    title: "Định Bộ Lĩnh, cậu bé chăn trâu lấy hoa lau làm cờ",
  );
  static var bookmarked = false;
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
            'Giai thoại lịch sử',
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
              const Image(image: AssetImage('assets/images/anecdote2.png')),
              const SizedBox(height: 8,),
              const Text(
                "Định Bộ Lĩnh, cậu bé chăn trâu lấy hoa lau làm cờ",
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
                        MaterialPageRoute(builder: (context) => const VideoPage('assets/videos/anecdote2.mp4')),
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
                      'Trong thời hiện đại, biểu tượng Đinh Tiên Hoàng cũng có những nấc thăng trầm khác nhau. Nếu như đầu thế kỷ 20, biểu tượng Hoàng đế khai mở nền chính thống không còn hữu dụng khi Việt Nam bị Pháp đô hộ, thì đến từ nửa sau thế kỷ này, ông lại trở thành biểu tượng đại diện cho khả năng tạo nên khối đại đoàn kết dân tộc trong công cuộc giữ gìn nền độc lập dân tộc. Đinh Bộ Lĩnh sinh ngày 15 tháng 2 năm Giáp Thân (924), tại làng Đại Hoàng. Nay còn dấu vết nền nhà cũ nơi ông sinh là Gò Bồ Đề (còn dấu tích tại trạm xá cũ, thôn Văn Hà, xã Gia Phương), cha là Đinh Công Trứ, mẹ là bà Đàm Thị. Lúc còn nhỏ Đinh Bộ Lĩnh chăn trâu cho chú là Đinh Dự. Đinh Bộ Lĩnh được bọn trẻ chăn trâu cùng lứa tôn làm đầu mục (trẻ đứng đầu). Lĩnh thường bầy cho bọn trẻ bẻ hoa lau làm cờ, chia quân đánh trận giả. Trận giả nhưng diễn ra như thật (nhờ lão bộc trước đây dạy cho), thể hiện chí khí, sự tài giỏi của Đinh Bộ Lĩnh. Sau mỗi trận tập, bọn trẻ khoanh tay làm kiệu rước Đinh Bộ Lĩnh như nghi vệ Thiên Tử. Trong lũ trẻ có mấy người cùng quê, cùng lứa tuổi, kết nghĩa anh em. Đó là: Đinh Bộ Lĩnh, Đinh Điền, Nguyễn Bặc, Lưu Cơ, Trịnh Tú, tôn Bộ Lĩnh làm anh cả. Sau khi Ngô Vương Quyền mất, triều Ngô lục đục, bất lực. Một số quan, tướng nổi dậy cát cứ xưng hùng xưng bá, đất nước loạn lạc. Sử cũ gọi loạn 12 sứ quân. Lúc đó, lực lượng của Đinh Bộ Lĩnh tương đối mạnh. Do khí phách và tài thao lược, nhân dân trong vùng theo về rất đông. Đinh Bộ Lĩnh nuôi ý chí dẹp loạn, thu giang sơn về một mối, thiết lập triều đình. Đinh Tiên Hoàng là vị anh hùng dân tộc, mở đầu và đặt nền thống nhất quốc gia, bước đầu xây dựng Nhà nước phong kiến Trung ương tập quyền. Bức Đại Tự “Chính thống thủy” trong đền vua Đinh ở Trường Yên khẳng định, minh chứng cho chân lý đó. “Bậc Đế vương chính thống của nước Việt ta khởi đầu từ đây. Các bậc vua Thánh Đế thần kế tiếp nhau chấn tác sau này cũng đều to rộng theo bài học của triều Đinh ”. Đó là “Ý trời sinh ra cho nước Việt ta bậc Thánh nhân sáng suốt để nối tiếp quốc thống”.',
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
