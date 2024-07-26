import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class LyPhatTuPage extends StatefulWidget {
  const LyPhatTuPage({super.key});
  @override
  _LyPhatTuPageState createState() => _LyPhatTuPageState();
}
class _LyPhatTuPageState extends State<LyPhatTuPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 33,
    image: AssetImage('assets/images/lyphattu.png'),
    title: "Lý Phật Tử giành nước rồi vong quốc",
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
            'Lý Phật Tử giành nước rồi vong quốc',
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
              Image(image: AssetImage('assets/images/lyphattu.png')),
              SizedBox(height: 8,),
              Text(
                "555 - 602",
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
                      'Lý Phật Tử có con trai là Nhã Lang, xin lấy con gái của Triệu Việt Vương là Cảo Nương. Việt Vương bằng lòng, nên hai nhà kết thành thông gia. Vì yêu quý Cảo Nương nên Việt Vương cho Nhã Lang ở gửi rể. Sau Nhã Lang biết được bí mật về quân sự của Triệu Việt Vương, báo lại cho Lý Phật Tử. Phật Tử mang quân đánh úp Việt Vương. Việt Vương tự biết thế yếu không thể chống được, bèn đem con gái chạy về phía nam, muốn tìm nơi đất hiểm để ẩn náu tung tích, nhưng đến đâu cũng bị quân của Phật Tử đuổi theo sau gót. Việt Vương cưỡi ngựa chạy đến cửa biển Đại Nha, bị nước chắn, than rằng: "Ta hết đường rồi!", bèn nhảy xuống biển tự vẫn. Lý Phật Tử lên làm vua cả nước, đóng đô ở Phong Châu. Vì ông cũng xưng là Lý Nam Đế, nên đời sau gọi là Hậu Lý Nam Đế để phân biệt với Lý Bí. Sau quân Tùy thuộc nhà Tùy bên Trung Quốc đến núi Đô Long gặp quân Lý, Lưu Phương đánh tan hết, rồi tiến quân sang đến cạnh dinh của Lý Phật Tử. Phương lấy họa phúc mà dụ. Phật Tử sợ hãi xin đầu hàng, bị quân Tuỳ bắt đưa về Bắc rồi chết. Dân làm đền thờ ở cửa biển Tiểu Nha[6] để đối với đền thờ Triệu Việt Vương.',
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
