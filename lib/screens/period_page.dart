import 'package:applichsu/screens/contact_page.dart';
import 'package:applichsu/screens/period_details1.dart';
import 'package:applichsu/screens/period_details2.dart';
import 'package:applichsu/screens/period_details3.dart';
import 'package:applichsu/screens/period_details4.dart';
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import '../constant_screen/event_page.dart';
import '../constant_screen/anecdote_page.dart';
import '../constant_screen/museum_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:applichsu/data/period_data.dart';
import 'package:applichsu/widgets/period.dart';
import 'package:applichsu/constants/period_details_index.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/search_page.dart';

class PeriodPage extends StatefulWidget {
  const PeriodPage({super.key});
  @override
  _PeriodPageState createState() => _PeriodPageState();
}
class _PeriodPageState extends State<PeriodPage>{
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

  @override
  Widget build(BuildContext context) {
    
    return
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SearchAnchor(
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
                      
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // Flexible(
                      IconButton(
                        color: Colors.white,
                        iconSize: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BookmarkPage()),
                          );
                        },
                        icon: const Icon(Icons.bookmark)
                      ),
                    // ),
                  ],
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        margin: const EdgeInsets.all(8),
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
                                image: const AssetImage('assets/images/hungvuong.png'),
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
                                          "Ngày này năm xưa",
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
                                          "Giỗ Tổ Hùng Vương",
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis, // Very long text ...
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
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
                            for(final periodModel in periodData)
                              PeriodWidget(
                                periodModel: periodModel,
                                onSelectPeriodModel: (){
                                  setState((){
                                    PeriodDetailsIndex.periodDetailsIndex = periodModel.index;
                                    if(PeriodDetailsIndex.periodDetailsIndex == 1){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const PeriodDetails1Page()),
                                      );
                                    }
                                    else if(PeriodDetailsIndex.periodDetailsIndex == 2){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const PeriodDetails2Page()),
                                      );
                                    }
                                    else if(PeriodDetailsIndex.periodDetailsIndex == 3){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const PeriodDetails3Page()),
                                      );
                                    }
                                    else{
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const PeriodDetails4Page()),
                                      );
                                    }
                                  });
                                }
                              ),
                          ],
                        ),
                      ),
                     
                       Padding(
                         padding: const EdgeInsets.only(left:300),
                         child: Container(
                            color: Colors.white,
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ContactPage()),
                                  );
                              },
                              icon: const Icon(Icons.email, color: Color.fromARGB(255, 204, 123, 2),),
                            ),
                          ),
                       ),
                      
                    ],
                  ),
                ),
                
              ],
            ),

          ),
        ),
      );
  }
}