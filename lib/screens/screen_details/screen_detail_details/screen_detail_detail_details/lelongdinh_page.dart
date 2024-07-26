import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class LeLongDinhPage extends StatefulWidget {
  const LeLongDinhPage({super.key});
  @override
  _LeLongDinhPageState createState() => _LeLongDinhPageState();
}
class _LeLongDinhPageState extends State<LeLongDinhPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 29,
    image: AssetImage('assets/images/lelongdinh.png'),
    title: "Lê Long Đĩnh",
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
            'Lê Long Đĩnh',
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
              Image(image: AssetImage('assets/images/lelongdinh.png')),
              SizedBox(height: 8,),
              Text(
                "1005 - 1009",
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
                      'Là một người có nhiều quân công, Lê Long Đĩnh liền sau đó hiểu rằng ông phải đích thân đi dẹp các hoàng tử khác thì mới mong có được sự trị vì vững chắc và yên ổn. Khi đó, Ngự Bắc vương Lê Long Cân và Trung Quốc vương Lê Long Kính chiếm trại Phù Lan để làm phản. Lê Long Đĩnh thân đi đánh, khiến Ngự Bắc vương Long Cân phải bắt Trung Quốc vương Long Kính đem nộp và xin đại xá. Long Đĩnh tha cho Long Cân, còn Long Kính bị xử tử. Ngự Man vương Lê Long Đinh do khiếp sợ cũng đầu hàng. Từ đấy về sau các vương và giặc cướp đều hàng phục cả. Sau đó, Lê Long Đĩnh đã củng cố ngoại giao bằng những chính sách rất mềm dẻo đối với nhà Tống. Ông rất chuộng Phật giáo, bằng việc xin thỉnh kinh Đại Tạng về. Ngoài ra, ông cũng chăm lo kinh tế bằng cách cho xây đắp các tuyến đường lớn, những con đường thủy bộ cho vững chắc để tiện việc giao thương. Vào những năm cuối đời, sách sử đa số nhận định rằng Lê Long Đĩnh là một hôn quân. Sách Đại Việt sử ký toàn thư nói, Lê Ngọa Triều tính hiếu sát thường thiêu sống, dìm nước hay dùng dao cùn mà tùng xẻo tù nhân; sư sãi vốn có thế lực rất lớn đối với chính sự nhưng Ngọa Triều từng sai người róc mía trên đầu sư Quách Ngang để làm trò cười; lại nuôi nhiều bọn hề làm trò khôi hài trong triều để làm loạn lời tâu việc của các quan. Do những việc làm đó, Ngọa Triều bị quan lại và dân chúng căm ghét. Sử cũng chép rằng, vì chơi bời sa đọa, nên Lê Long Đĩnh bị bệnh trĩ không ngồi được, phải nằm mà coi chầu, nên được gọi là Lê Ngọa Triều. Tương truyền, khi Lê Long Việt bị giết, triều đình phải bỏ chạy, không ai dám đến gần xác vị Hoàng đế trẻ, duy chỉ có Lý Công Uẩn là ôm đến gào khóc, Lê Long Đĩnh vì ấn tượng hành động này, về sau cất nhắc Lý Công Uẩn nhiều chức vụ quan trọng thân cận. Có lần, Lê Long Đĩnh ăn quả khế lại thấy hột mận (chữ Lý nghĩa là mận), mới tin lời sấm ngữ, ngầm tìm người họ Lý giết đi, thế mà Lý Công Uẩn ở ngay bên cạnh lại không hề bị nghi ngờ. Năm 1009, Lê Long Đĩnh qua đời lúc mới 24 tuổi, ở ngôi 4 năm. Nhân các con của Long Đĩnh còn bé, Điện tiền Lý Công Uẩn cùng Hữu điện tiền chỉ huy sứ là Nguyễn Đê mỗi người được đem 500 quân Tùy Long vào làm Túc vệ. Thế rồi cùng nhau dìu Công Uẩn lên chính điện, lập làm thiên tử, lên ngôi Hoàng đế. Trăm quan đều lạy rạp dưới sân, trong ngoài đều hô "vạn tuế", vang dậy cả trong triều. Đại xá cho thiên hạ, lấy năm sau làm niên hiệu Thuận Thiên năm đầu.',
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
