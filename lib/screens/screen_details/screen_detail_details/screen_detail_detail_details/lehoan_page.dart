import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class LeHoanPage extends StatefulWidget {
  const LeHoanPage({super.key});
  @override
  _LeHoanPageState createState() => _LeHoanPageState();
}
class _LeHoanPageState extends State<LeHoanPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    image: AssetImage('assets/images/lehoan.png'),
    title: "Lê Hoàn lên ngôi",
  );

  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
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
            'Lê Hoàn lên ngôi',
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
          const Column(
            children: [
              Image(image: AssetImage('assets/images/lehoan.png')),
              SizedBox(height: 8,),
              Text(
                "980 - 1005",
                textAlign: TextAlign.left,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8,),
              Divider(
                color: Colors.grey,
                thickness: 2,
                height: 16,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Sau khi Đinh Tiên Hoàng và con là Đinh Liễn bị ám hại, Vệ Vương Toàn lên ngôi, hiệu Đinh Phế Đế, Lê Hoàn làm phụ chính, xưng là Phó vương. Triều thần sợ Lê Hoàn cướp ngôi vị của Thiếu đế, nên các công thần là Định Quốc công Nguyễn Bặc và Ngoại giáp Đinh Điền dẫn quân về kinh đô định giết Lê Hoàn. Lực lượng này thua trận và bị Lê Hoàn giết. Năm 981, quân Tống nhân cơ hội đem quân sang muốn cướp nước. Khi triều đình đang bàn kế hoạch xuất quân thì Phạm Cự Lạng cùng các tướng quân khác đều mặc áo trận đi thẳng vào Nội phủ, nói với mọi người: "Thưởng người có công, giết kẻ trái lệnh là phép sáng để thi hành việc quân. Nay chúa thượng còn trẻ thơ, chúng ta dẫu hết sức liều chết để chặn giặc ngoài, may có chút công lao, thì có ai biết cho ? Chi bằng trước hãy tôn lập ông Thập đạo làm Thiên tử, sau đó sẽ xuất quân thì hơn". Quân sĩ đều hô vạn tuế. Lúc đó, người đứng đầu triều đình là Dương Thái hậu không còn cách nào khác do mọi quân sĩ đều tôn lập Lê Hoàn, bèn thuận theo, sai lấy áo long cổn khoác lên người Lê Hoàn, đưa Lê Hoàn lên làm Hoàng đế. Đây chính là thời khắc lập ra nhà Tiền Lê.  Lê Hoàn vì muốn ổn định chính trị bên trong, đã cưới Dương Thái hậu làm một trong các Hoàng hậu của mình. Theo quan điểm Nho giáo của các nhà chép sử sau này, như trong Đại Việt sử ký toàn thư đã viết, thì ông bị chê trách về đạo vợ chồng do ông đã lập Dương Thái hậu làm Hoàng hậu của mình. Tuy nhiên, điều đó cũng không cản trở ông có nhiều thành tựu xây dựng quốc gia, cũng như chứng minh được tài trị vì của mình. Trong khi cai trị, ông đã cho xây dựng nhiều công trình, đẩy mạnh sản xuất nông nghiệp và thủ công nghiệp để chấn hưng nền kinh tế. Ông là vị Hoàng đế trong lịch sử mở đầu cho lễ tịch điền nhằm khuyến khích sản xuất nông nghiệp dưới chế độ phong kiến Việt Nam.',
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
            ],
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
