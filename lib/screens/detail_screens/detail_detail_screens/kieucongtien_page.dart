import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
// import 'package:applichsu/data/kieucongtien_data.dart';
// import 'package:applichsu/widgets/kieucongtien_widget.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details6_page.dart';
import 'package:applichsu/screens/detail_screens/event_details1_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/main_screens/search_page.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class KieuCongTienPage extends StatefulWidget {
  const KieuCongTienPage({super.key});
  @override
  _KieuCongTienPageState createState() => _KieuCongTienPageState();
}
class _KieuCongTienPageState extends State<KieuCongTienPage>{
  int _screenIndex = 0;
  bool shorten = true;
  static var bookmarked = false;
  late SearchController _controller;
  late TextEditingController textController;

  var bm = const BookmarkModel(
    index: 19,
    image: AssetImage('assets/images/kieucongtien.png'),
    title: "Kiều Công Tiễn phản chủ bị giết",
  );

  @override
  void initState(){
    _controller = SearchController();
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    textController.dispose();
    super.dispose();
    
  }


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

  void onSelectDuongDinhNgheModel(int index){
    
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
            'Kiều Công Tiễn phản chủ bị giết',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SearchAnchor(
                  searchController: _controller,
                  headerTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 15,
                  ),
                  
                  viewLeading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: (){
                      _controller.clear();
                      Navigator.of(context).pop();
                    },
                  ),
                  viewTrailing: {
                    IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white),
                      onPressed: (){
                        setState(() {
                          if(_controller.value.text.isNotEmpty){
                            _controller.clear();
                          }
                          else{
                            Navigator.of(context).pop();
                          }
                        });
                      },
                    ),
                  },
                  viewBackgroundColor: Colors.black,
                  viewOnSubmitted: (_) {
                    for(final data in searchDatas){
                      if(data.title.contains(_controller.value.text)){
                        searchData.add(data);
                      }
                    } 
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchPage()),
                    );
                    
                  },
                  builder: (BuildContext context, _controller)
                  {
                    return SearchBar(
                      hintText: "Tìm kiếm",
                      hintStyle: const WidgetStatePropertyAll(
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(Colors.black),
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)
                      ),
                      textStyle: const WidgetStatePropertyAll(
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      
                      onTap: () {
                        _controller.openView();
                      },
                      onChanged: (_) {
                        _controller.openView();
                      },
                      
                      leading: const Icon(Icons.search, color: Colors.white,),
                  
                    );
                  },
                  suggestionsBuilder:
                  (BuildContext context, _controller) {
                    return List<ListTile>.generate(3, (int index) {
                      final String item;
                      if(index == 1){
                        item = "Cuộc khởi nghĩa của Hai Bà Trưng giành thắng lợi";
                      }
                      else if(index == 2){
                        item = "Đinh Bộ Lĩnh, cậu bé chăn trâu lấy hoa lau làm cờ";
                      }
                      else{
                        item = "Ấn vàng Sắc mệnh chi bảo";
                      }
                      return ListTile(
                        title: Text(item, style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          setState(() {
                            _controller.clear();
                            _controller.closeView(item);
                          });
                          if(index == 1){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EventDetails1Page()),
                            );
                          }
                          else if(index == 2){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AnecdoteDetails2Page()),
                            );
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MuseumDetails6Page()),
                            );
                          }
                        },
                      );
                    });
                  }
                ),
                const SizedBox(height: 12),
                const Image(image: AssetImage('assets/images/kieucongtien.png')),
                const SizedBox(height: 9,),
                const Text(
                  "937 - 938",
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8,),
                const Divider(
                  color: Colors.grey,
                  thickness: 2,
                  height: 16,
                  indent: 5,
                  endIndent: 5,
                ),
                const SizedBox(height: 8),
                const Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Kiều Công Tiễn nắm lấy quyền bính, trở thành Tiết độ sứ thứ 5 thời Tự chủ. Theo các thần phả, ngay trong hàng ngũ họ Kiều cũng có chia rẽ về sự việc này. Con Công Tiễn là Công Chuẩn và cháu nội là Kiều Công Hãn không theo Tiễn. Công Chuẩn mang con nhỏ là Công Đĩnh về Phong châu, Công Hãn mang quân vào châu Ái theo Ngô Quyền. Chỉ có một người con khác của Chuẩn là Thuận theo giúp ông nội. Một số tướng cũ của Dương Đình Nghệ mà tiêu biểu là Ngô Quyền - con rể Đình Nghệ - quyết tâm tiêu diệt Kiều Công Tiễn. Ngô Quyền đang trấn thủ Ái châu, tập hợp lực lượng ở đó và phát lời kêu gọi mọi người chống Công Tiễn. Các hào trưởng, hào kiệt nhiều nơi như Dương Tam Kha, Đinh Công Trứ, Kiều Công Hãn, Đỗ Cảnh Thạc,... về theo. Tháng 4 năm 938, Ngô Quyền mang quân ra bắc, nhanh chóng hạ thành Đại La, giết chết Kiều Công Tiễn. Khi đó quân Hán chưa kịp đến cứu giúp Tiễn. Công Tiễn xưng Tiết độ sứ chưa đầy 1 năm. Cuối năm 938, quân Nam Hán do con Lưu Cung là Lưu Hoằng Tháo chỉ huy mới kéo sang Tĩnh Hải quân. Ngô Quyền đóng cọc nhọn dưới sông Bạch Đằng nhử quân Hán kéo vào, làm cho thuyền địch mắc cạn khi thủy triều rút xuống và đánh tan, giết chết Hoằng Tháo. Quân Nam Hán thua to, Lưu Cung phải từ bỏ ý định đánh Tĩnh Hải quân. Ngô Quyền làm chủ Tĩnh Hải quân, không làm Tiết độ sứ nữa mà xưng là Ngô vương, lập ra nhà Ngô, bỏ hẳn sự ràng buộc với phương Bắc, dù chỉ là trên danh nghĩa.',
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
                const SizedBox(height: 8),
              ],
            ),
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
