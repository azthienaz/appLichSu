import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/screens/contact_page.dart';
import 'package:applichsu/constant_screen/event_page.dart';
import 'package:applichsu/constant_screen/period_details_page.dart';
import 'package:applichsu/data/period_details4_data.dart';
import 'package:applichsu/widgets/period_details4.dart';

class PeriodDetails4Page extends StatefulWidget {
  const PeriodDetails4Page({super.key});
  @override
  _PeriodDetails4PageState createState() => _PeriodDetails4PageState();
}
class _PeriodDetails4PageState extends State<PeriodDetails4Page>{
  int _screenIndex = 0;
  bool shorten = true;
  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  void onSelectPeriodDetails4Model(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConstantPeriodDetailsPage()),
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
                  viewBackgroundColor: Colors.black,
                  builder: (BuildContext context, SearchController controller)
                  {
                    return SearchBar(
                      hintText: "Tìm kiếm",
                      textStyle: const WidgetStatePropertyAll(
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      hintStyle: const WidgetStatePropertyAll(
                        TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontStyle: FontStyle.normal,
                          fontSize: 15,
                        ),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(Colors.black),
                      controller: controller,
                      padding: const WidgetStatePropertyAll<EdgeInsets>(
                          EdgeInsets.symmetric(horizontal: 16.0)),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search, color: Colors.white,),
                  
                    );
                  },
                  suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(3, (int index) {
                      final String item = 'hentaiz.icu #$index';
                      return ListTile(
                        title: Text(item, style: const TextStyle(color: Colors.white)),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ContactPage()),
                            );
                        },
                      );
                    });
                  }
                ),
                const SizedBox(height: 8),
                Card(
                  margin: const EdgeInsets.all(12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  clipBehavior: Clip.hardEdge,
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ConstantEventPage()),
                      );
                    },
                    child: Stack(
                      children: [
                        FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: const AssetImage('assets/images/period1.png'),
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          right: 10,
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "939 - 1945",
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis, // Very long text ...
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    "Thời kỳ Quân chủ",
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis, // Very long text ...
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 90, 89, 86),
                                    ),
                                  ),
                                ),
                              ],
                            )     
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      children: [
                        Text(
                          'Thời kỳ Hồng Bàng theo truyền thuyết và dã sứ cho rằng bắt đầu từ năm 2879 TCN, là niên đại của Kinh Dương Vương, với quốc hiệu Xích Quỷ. Lãnh thổ của quốc gia dưới thời Kinh Dương Vương rộng lớn, phía bắc tới sông Dương Tử (cả vùng ô Động Đình), phía nam tới nước Hồ Tôn (Chiêm Thành), phía Đông là Đông Hải (một phần của Thái Bình Dương), phía Tây là Ba Thục (Tứ Xuyên, Trung Hoa ngày nay).',
                          style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w700),
                          softWrap: shorten,
                          overflow: shorten == false ? TextOverflow.ellipsis : null,
                        ),
                        const SizedBox(height: 3),
                        TextButton(
                          child: const Text(
                            'Thu nhỏ',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 221, 156, 58),
                            ),
                          ),
                          onPressed: (){
                            setState(() {
                              shorten = !shorten;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8,),
                Expanded(
                  child: GridView(
                    padding: const EdgeInsets.all(20),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    children: [
                      for(final periodDetailsModel in periodDetails4Data)
                        PeriodDetails4Widget(
                          periodDetailsModel: periodDetailsModel,
                          onSelectPeriodDetails4Model: onSelectPeriodDetails4Model,
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
