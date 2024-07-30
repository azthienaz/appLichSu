import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class TrungSuyPage extends StatefulWidget {
  const TrungSuyPage({super.key});
  @override
  _TrungSuyPageState createState() => _TrungSuyPageState();
}
class _TrungSuyPageState extends State<TrungSuyPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 47,
    image: AssetImage('assets/images/trungsuy.png'),
    title: "Thời trung suy",
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
            'Thời trung suy',
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
              Image(image: AssetImage('assets/images/trungsuy.png')),
              SizedBox(height: 8,),
              Text(
                "1128 - 1175",
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
                      'Năm 1128, Lý Nhân Tông qua đời, hưởng thọ 63 tuổi, Dương Hoán lúc đó mới 11 tuổi lên nối ngôi, tức là Lý Thần Tông. Có một truyền thuyết rằng Thần Tông là do Từ Đạo Hạnh đầu thai. Việc Nhân Tông qua đời và truyền ngôi cho Thần Tông đánh dấu sự chuyển dời ngôi vua từ chi trưởng cho chi dưới và cũng kết thúc thời kỳ phát triển đỉnh cao của nhà Lý. Từ Nhân Tông trở đi, trong 4 đời vua liên tiếp, người kế vị của nhà Lý đều nhỏ tuổi. Tuy việc cai trị bên ngoài chưa có nhiều ảnh hưởng trong thời kỳ đầu nhưng trong cung đình đã chịu ảnh hưởng trực tiếp vì sự tranh chấp quyền lực của những người tham gia nhiếp chính. Năm 1174, nhà Lý lại xảy ra việc thay ngôi thái tử. Thái tử là Lý Long Xưởng gian dâm với cung phi, làm chuyện thất đức nên bị phế truất làm Bảo Quốc vương. Anh Tông lập người con trai nhỏ là Lý Long Cán, con của một cung phi là cháu gái Đỗ Anh Vũ, làm Hoàng thái tử. Tô Hiến Thành làm "Nhập nội kiểm hiệu Thái phó bình chương quân quốc trọng sự", tước Vương, được giao phụ chính giúp người kế vị. Năm 1175, Anh Tông qua đời khi mới 40 tuổi, trị vì được 36 năm. Thái tử còn nhỏ tuổi lên ngôi, sử gọi là Lý Cao Tông. Từ đây nhà Lý bắt đầu con đường suy vong.',
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
