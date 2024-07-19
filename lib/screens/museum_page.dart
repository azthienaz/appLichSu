import 'package:applichsu/screens/contact_page.dart';
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import '../widgets/museum.dart';
import 'package:applichsu/data/museum_data.dart';
import 'package:applichsu/constant_screen/museum_page.dart';

class MuseumPage extends StatefulWidget {
  const MuseumPage({super.key});
  @override
  _MuseumPageState createState() => _MuseumPageState();
}
class _MuseumPageState extends State<MuseumPage>{

  void onSelectMuseumModel(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConstantMuseumPage()),
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
                          crossAxisCount: 2,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        children: [
                          for(final museumModel in museumData)
                            MuseumWidget(
                              museumModel: museumModel,
                              onSelectMuseumModel: onSelectMuseumModel,
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