import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
// import 'package:applichsu/data/duongdinhnghe_data.dart';
// import 'package:applichsu/widgets/duongdinhnghe_widget.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details6_page.dart';
import 'package:applichsu/screens/detail_screens/event_details1_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/main_screens/search_page.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class DuongDinhNghePage extends StatefulWidget {
  const DuongDinhNghePage({super.key});
  @override
  _DuongDinhNghePageState createState() => _DuongDinhNghePageState();
}
class _DuongDinhNghePageState extends State<DuongDinhNghePage>{
  int _screenIndex = 0;
  bool shorten = true;
  static var bookmarked = false;
  late SearchController _controller;
  late TextEditingController textController;
  var bm = const BookmarkModel(
    index: 18,
    image: AssetImage('assets/images/duongdinhnghe.png'),
    title: "Dương Đình Nghệ đánh đuổi Nam Hán",
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
            'Dương Đình Nghệ đánh đuổi Nam Hán',
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
                const Image(image: AssetImage('assets/images/duongdinhnghe.png')),
                const SizedBox(height: 9,),
                const Text(
                  "931 - 934",
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
                        'Một tướng cũ của Khúc Hạo là Dương Đình Nghệ, người Ái Châu (Thanh Hóa) không thần phục Nam Hán. Ông tập hợp lực lượng ở quê nhà để chống lại. Để lung lạc ông, vua Nam Hán là Lưu Cung sai người phong ông làm Thứ sử Ái châu. Nhưng chẳng bao lâu sau, tháng 3 năm 931, Dương Đình Nghệ ra quân từ Ái châu, đánh bại Lý Khắc Chính, đánh đuổi Thứ sử Lý Tiến của Nam Hán. Lý Tiến bỏ chạy, Dương Đình Nghệ giải phóng thành Đại La. Lưu Cung sai Trần Bảo mang quân sang tiếp viện. Dương Đình Nghệ chủ động mở cửa thành nghênh đón địch, tiêu diệt viện binh Nam Hán, chém chết Trần Bảo. Dương Đình Nghệ làm chủ Tĩnh Hải quân, ông tự lập làm Tiết độ sứ. Ông là Tiết độ sứ thứ 4 trong thời Tự chủ. Sử sách không nói về việc cai trị của ông. Tháng 4 năm 937, ông bị một tướng dưới quyền là Kiều Công Tiễn, hào trưởng Phong Châu, giết hại để cướp quyền.',
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
