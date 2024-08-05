import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class DinhBoLinhPage extends StatefulWidget {
  const DinhBoLinhPage({super.key});
  @override
  _DinhBoLinhPageState createState() => _DinhBoLinhPageState();
}
class _DinhBoLinhPageState extends State<DinhBoLinhPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 23,
    image: AssetImage('assets/images/dinhbolinh.png'),
    title: "Đinh Bộ Lĩnh",
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
            'Đinh Bộ Lĩnh',
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
              Image(image: AssetImage('assets/images/dinhbolinh.png')),
              SizedBox(height: 8,),
              Text(
                "965 - 979",
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
                      'Trong số các lực lượng nổi dậy chống triều đình, nổi lên Đinh Bộ Lĩnh (Đinh Hoàn). Ông là người Hoa Lư, châu Đại Hoàng. Có cha là Đinh Công Trứ - nha tướng của Dương Đình Nghệ, giữ chức Thứ sử Hoan Châu(Nghệ An, Hà Tĩnh ngày nay). Thời kỳ đó, Đinh Bộ Lĩnh đã cùng những người thân thiết tổ chức lực lượng, rèn vũ khí, xây dựng căn cứ ở Hoa Lư. Sau vì bất đồng với người chú, Đinh Bộ Lĩnh cùng con trai Đinh Liễn sang đầu quân trong đạo binh của Sứ quân Trần Minh Công (Trần Lãm) ở Bố Hải Khẩu. Sau khi Trần Minh Công chết, Đinh Bộ Lĩnh thay quyền, chiêu mộ binh lính, chiêu dụ được sứ quân Phạm Bạch Hổ cùng nhiều sứ quân khác chống nhà Ngô và tiến đánh các sứ quân còn lại. Trong hơn 3 năm, nhờ tài năng của mình, Đinh Bộ Lĩnh được nhân dân nhiều địa phương giúp sức, ủng hộ, đánh đâu thắng đấy, được tôn là Vạn Thắng vương. Các sứ quân lần lượt bị đánh bại hoặc xin hàng. Tình trạng cát cứ chấm dứt. Cuối năm 967, đất nước trở lại bình yên, thống nhất.',
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
