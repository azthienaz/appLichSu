import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/constant_screen/anecdote_page.dart';
import 'package:applichsu/constant_screen/museum_page.dart';
import 'package:applichsu/constant_screen/event_page.dart';
import 'package:applichsu/data/period_details3_data.dart';
import 'package:applichsu/widgets/period_details3.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/search_page.dart';
class ConstantPeriodDetailsPage extends StatefulWidget {
  const ConstantPeriodDetailsPage({super.key});
  @override
  _ConstantPeriodDetailsPageState createState() => _ConstantPeriodDetailsPageState();
}
class _ConstantPeriodDetailsPageState extends State<ConstantPeriodDetailsPage>{
  int _screenIndex = 0;
  bool shorten = true;
  late SearchController _controller;
  late TextEditingController textController;

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
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  void onSelectPeriodDetails3Model(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConstantEventPage()),
    );
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
          title: const Center(
            child: Text(
              'Thời kỳ lịch sử',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: 
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                            _controller.closeView(item);
                          });
                          if(index == 1){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ConstantEventPage()),
                            );
                          }
                          else if(index == 2){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ConstantAnecdotePage()),
                            );
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ConstantMuseumPage()),
                            );
                          }
                        },
                      );
                    });
                  }
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.8,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    children: [
                      for(final periodDetailsModel in periodDetails3Data)
                        PeriodDetails3Widget(
                          periodDetailsModel: periodDetailsModel,
                          onSelectPeriodDetails3Model: onSelectPeriodDetails3Model,
                        ),
                    ],
                  ),
                ),

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
