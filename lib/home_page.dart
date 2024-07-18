import 'package:flutter/material.dart';
// import 'screens/login_page.dart';
// import 'screens/settings_page.dart';
import 'screens/bookmark_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    
    return
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 228, 160, 59), Colors.white])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
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
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
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

          ),
        ),
      );
  }
}
