import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class ThinhTriPage extends StatefulWidget {
  const ThinhTriPage({super.key});
  @override
  _ThinhTriPageState createState() => _ThinhTriPageState();
}
class _ThinhTriPageState extends State<ThinhTriPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    image: AssetImage('assets/images/thinhtri.png'),
    title: "Thời thịnh trị",
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
            'Thời thịnh trị',
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
              Image(image: AssetImage('assets/images/thinhtri.png')),
              SizedBox(height: 8,),
              Text(
                "1029 - 1128",
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
                      'Ngay từ thời Lý Thái Tổ đến các vị hoàng đế tiếp theo là Thái Tông và Thánh Tông, nhà Lý tập trung giải quyết những vấn đề lớn sau: Củng cố nội trị: Phát triển kinh tế, đặc biệt là nông nghiệp; ban hành Hình thư, hệ thống pháp luật đầu tiên từ khi giành độc lập sau thời Bắc thuộc; xác lập hệ thống giáo dục khoa cử có hệ thống. Củng cố cương vực cai trị, vươn rộng quyền lực đến những vùng xa. Nhà Lý dùng chính sách hôn nhân, gả công chúa cho các tù trưởng địa phương để thắt chặt mối quan hệ. Với những nơi không thần phục, vua cử các hoàng tử hoặc thân chinh đi đánh dẹp. Chính sử ghi nhận ba vị vua đầu triều Lý đã nhiều lần xuất quân các châu như Vị Long, Đô Kim, Thường Tân, Bình Nguyên, Định Nguyên, Trệ Nguyên, Thất Nguyên, Văn, Hoan, Diễn, Phong v.v... Lớn nhất là biến loạn họ Nùng những năm 1038-1041. Bảo vệ biên giới các phía: giải quyết những xung đột nhỏ xảy ra vùng biên với nhà Tống, và thường có liên quan tới các tù trưởng địa phương; đánh lui những cuộc tấn công cướp phá của Nam Chiếu, Chiêm Thành. Một sự kiện lớn trong những năm thịnh trị thời Lý là việc đổi quốc hiệu từ Đại Cồ Việt sang Đại Việt vào năm 1054, mở ra kỷ nguyên Đại Việt trong lịch sử Việt Nam. Năm 1076, nhà Tống cử Quách Quỳ, một viên tướng dày dạn trận mạc cùng Triệu Tiết đem đại binh sang xâm lược Đại Việt. Thế quân nhà Tống rất mạnh, quân đội nhà Lý dưới sự chỉ huy của Lý Thường Kiệt đã chống trả hết sức quyết liệt. Ông đã cử Lý Kế Nguyên đánh bại đội quân thủy của quân Tống sang kết hợp với quân bộ của Quách Quỳ. Cuối cùng, Lý Thường Kiệt đánh bại được đội quân nhà Tống tại trận tuyến trên sông Như Nguyệt. Năm 1077, Quách Quỳ chấp nhận cho Đại Việt giảng hòa và rút quân trở về. Nhà Lý vượt qua thử thách lớn nhất từ khi hình thành và tiếp tục thịnh trị. Sau khi đánh được quân Tống, Nhân Tông bắt tay vào việc cai trị, mở khoa thi đầu tiên và chọn ra 10 người thi đỗ, nổi tiếng nhất là Lê Văn Thịnh (黎文盛). Ông còn củng cố nông nghiệp, cấm nạn giết trâu và xử phạt rất nặng. Quốc gia yên bình, Nhân Tông chuyên tâm theo Phật giáo, mở nhiều cuộc vui như đua thuyền, múa rối nước,... Đại Việt luôn có hội hè, trở nên cực kỳ phồn vinh và phát triển.',
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
