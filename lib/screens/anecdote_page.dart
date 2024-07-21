import 'package:applichsu/constant_screen/event_page.dart';
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import '../widgets/anecdote.dart';
import '../constant_screen/museum_page.dart';
import 'package:applichsu/data/anecdote_data.dart';
import 'package:applichsu/constant_screen/anecdote_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/data/search_datas.dart';
import 'package:applichsu/screens/search_page.dart';
class AnecdotePage extends StatefulWidget {
  const AnecdotePage({super.key});
  @override
  _AnecdotePageState createState() => _AnecdotePageState();
}
class _AnecdotePageState extends State<AnecdotePage>{

  void onSelectAnecdoteModel(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConstantAnecdotePage()),
    );
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
                        viewBackgroundColor: Colors.black,
                        builder: (BuildContext context, SearchController controller)
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
                            controller: controller,
                            padding: const WidgetStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 16.0)),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            onSubmitted: (String text) {
                              for(final data in searchDatas){
                                if(text == data.title){
                                  searchData.add(data);
                                }
                              }
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const SearchPage()),
                              );
                            },
                            leading: const Icon(Icons.search, color: Colors.white,),
                        
                          );
                        },
                        suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
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
                                  controller.closeView(item);
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
                      Expanded(
                      child: GridView(
                        padding: const EdgeInsets.all(20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.9,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        children: [
                          for(final anecdoteModel in anecdoteData)
                            AnecdoteWidget(
                              anecdoteModel: anecdoteModel,
                              onSelectAnecdoteModel: onSelectAnecdoteModel,
                            ),
                        ],
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