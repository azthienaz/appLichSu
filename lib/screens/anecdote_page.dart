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