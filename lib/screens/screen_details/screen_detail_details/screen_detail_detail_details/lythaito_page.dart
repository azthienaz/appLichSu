import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class LyThaiToPage extends StatefulWidget {
  const LyThaiToPage({super.key});
  @override
  _LyThaiToPageState createState() => _LyThaiToPageState();
}
class _LyThaiToPageState extends State<LyThaiToPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 34,
    image: AssetImage('assets/images/lythaito.png'),
    title: "Lý Thái Tổ, dời đô về Đại La",
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
            'Lý Thái Tổ, dời đô về Đại La',
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
              Image(image: AssetImage('assets/images/lythaito.png')),
              SizedBox(height: 8,),
              Text(
                "1009 - 1028",
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
                      'Tháng 10 năm 1009, vua nhà Tiền Lê là Long Đĩnh mất, các con còn nhỏ, quan Điện tiền Chỉ huy sứ là Lý Công Uẩn được sự ủng hộ của Chi nội là Đào Cam Mộc cùng thiền sư Vạn Hạnh đã lên ngôi hoàng đế; các quan trong triều đều nhất trí suy tôn. Gần 1 năm sau khi lên ngôi vua, tháng 7 âm lịch năm 1010, Lý Thái Tổ tiến hành dời đô từ Hoa Lư (Ninh Bình) về Đại La (Hà Nội). Ông đã ban hành Chiếu dời đô vào mùa xuân năm 1010. Việc tìm đất, nghị bàn đến việc chuẩn bị để dời đô diễn ra tương đối khẩn trương. Từ Hoa Lư về thành Đại La có thể đi theo đường bộ hoặc theo đường thủy. Sử cũ không ghi chép chi tiết nhà Lý dời đô bằng đường nào. Các nhà nghiên cứu đã kết luận: triều nhà Lý dời đô bằng đường thủy, và chỉ có dời đô bằng đường thủy thì mới an toàn và tải được cả bộ máy triều đình đông đảo cùng vật chất bảo đảm đồ sộ đi kèm. Các nhà nghiên cứu khẳng định Lý Thái Tổ dời đô cũng cần dùng tới đội thuyền. Đoàn thuyền xuất phát từ bến Ghềnh Tháp (nay là khu vực giữa phủ Vườn Thiên và nhà bia Lý Thái Tổ ở Khu di tích Cố đô Hoa Lư). Rồi thuyền vào sông Sào Khê, qua cầu Đông, cầu Dền ở Hoa Lư để ra bến đò Trường Yên vào sông Hoàng Long. Đi tiếp đến Gián Khẩu thì rẽ vào sông Đáy. Từ sông Đáy lại rẽ vào sông Châu Giang. Đến Phủ Lý đoàn thuyền ngược sông Hồng, rồi vào sông Tô Lịch trước cửa thành Đại La.',
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
