import 'package:applichsu/screens/contact_page.dart';
import 'package:applichsu/screens/period_detail.dart';
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import '../widgets/event.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:applichsu/data/period_data.dart';
import 'package:applichsu/widgets/period.dart';

class PeriodPage extends StatefulWidget {
  const PeriodPage({super.key});
  @override
  _PeriodPageState createState() => _PeriodPageState();
}
class _PeriodPageState extends State<PeriodPage>{

  void onSelectPeriodModel(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PeriodDetailPage()),
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
                              MaterialPageRoute(builder: (context) => const EventWidget()),
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
                                onSelectPeriodModel: onSelectPeriodModel,
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