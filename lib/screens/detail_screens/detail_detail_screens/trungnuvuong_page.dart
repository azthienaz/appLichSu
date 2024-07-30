import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details6_page.dart';
import 'package:applichsu/screens/detail_screens/event_details1_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/main_screens/search_page.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class TrungNuVuongPage extends StatefulWidget {
  const TrungNuVuongPage({super.key});
  @override
  _TrungNuVuongPageState createState() => _TrungNuVuongPageState();
}
class _TrungNuVuongPageState extends State<TrungNuVuongPage>{
  int _screenIndex = 0;
  bool shorten = true;
  static var bookmarked = false;
  late SearchController _controller;
  late TextEditingController textController;
  var bm = const BookmarkModel(
    index: 20,
    image: AssetImage('assets/images/event1.png'),
    title: "Trưng nữ vương",
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

  void onSelectTrungNuVuongModel(int index){
    
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
            'Trưng nữ vương',
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
                const Image(image: AssetImage('assets/images/event1.png')),
                const SizedBox(height: 9,),
                const Text(
                  "40 - 43",
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
                      'Bấy giờ ở huyện Mê Linh (vùng đất từ Ba Vì đến Tam Đảo, nay thuộc Hà Nội, Vĩnh Phúc), có hai chị em Trưng Trắc và Trưng Nhị là con gái của Lạc tướng thuộc dòng dõi Hùng Vương. Chồng bà Trưng Trắc là Thi Sách - con trai của Lạc tướng huyện Chu Diên (vùng Đan Phượng và Từ Liêm, Hà Nội ngày nay). Gia đình của Thi Sách là một gia đình yêu nước và có thế lực ở vùng đất Chu Diên. Bất bình trước chế độ cai trị hà khắc của chính quyền nhà Hán, hai gia đình Lạc tướng cùng nhau lập mưu đánh đổ ách thống trị của nhà Hán để giành lại độc lập cho dân tộc. Họ bí mật tìm cách liên kết với các thủ lĩnh ở mọi miền đất nước để chuẩn bị nổi dậy nhưng không may, Thi Sách đã bị quân Hán giết hại với mục đích làm giảm thế lực đối địch với chính quyền đô hộ, đồng thời đe dọa nhân dân ta, dập tắt ý định chống đối của các thủ lĩnh. Tuy nhiên điều này không những không dập tắt được ý định nổi dậy của dân ta mà còn làm tinh thần tiến hành khởi nghĩa của nhân dân ta đạt đến đỉnh điểm. Mùa xuân năm 40 (khoảng tháng 3 dương lịch), Hai Bà Trưng dựng cờ khởi nghĩa ở Hát Môn (Hà Nội). Tương truyền, vào ngày xuất quân, bà Trưng Trắc trên dàn thề trước ba quân đã đặt nợ nước lên trên thù chồng, bà đọc lời thề, sau này được viết thành 4 câu thơ như sau: "Một xin rửa sạch nước thù, Hai xin đem lại nghiệp xưa họ Hùng, Ba kẻo oan ức lòng chồng, Bốn xin vẹn vẹn sở công lênh này". Được nhân dân khắp nơi ủng hộ và hưởng ứng, nghĩa quân của Hai Bà Trưng đi đến đâu, chính quyền và quân đội nhà Đông Hán tan vỡ đến đấy. Tô Định hoảng hốt phải bỏ thành, cắt tóc, cạo râu, lẻn trốn về Nam Hải (Quảng Đông - Trung Quốc). Bọn Thứ sử, Thái thú khác của nhà Đông Hán thấy nghĩa quân nổi lên như vũ bão thì cũng đều hoảng sợ và theo nhau bỏ chạy về Trung Quốc.',
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
