import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class LoanTamVuongPage extends StatefulWidget {
  const LoanTamVuongPage({super.key});
  @override
  _LoanTamVuongPageState createState() => _LoanTamVuongPageState();
}
class _LoanTamVuongPageState extends State<LoanTamVuongPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    image: AssetImage('assets/images/loantamvuong.png'),
    title: "Loạn tam vương",
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
            'Loạn tam vương',
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
              Image(image: AssetImage('assets/images/loantamvuong.png')),
              SizedBox(height: 8,),
              Text(
                "1028 - 1029",
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
                      'Khoảng tháng 3 năm 1028, Lý Thái Tổ qua đời, hưởng dương 55 tuổi, thụy hiệu là Thần Vũ Hoàng đế, an táng ở Thọ lăng. Các đại thần đều đến cung Long Đức để dâng biểu, xin Thái tử Lý Phật Mã lên ngôi nhưng 3 người em của ông là Đông Chinh vương, Dực Thánh vương và Vũ Đức vương không đồng ý nên đem quân của mình phục sẵn ở trong Hoàng thành nhằm cướp ngôi. Lúc đó Đông Chinh vương phục ở trong Long Thành còn Dực Thánh vương và Vũ Đức vương phục binh ở cửa Quảng Phúc, đợi Thái tử đến sẽ đánh úp. Một lát sau, Thái tử từ cửa Tường Phù vào, đến điện Càn Nguyên, biết có biến, sai người hầu đóng hết các cửa điện và sai các vệ sĩ trong cung phòng giữ. Thấy Phật Mã không nỡ xuống tay, nội thị là Lý Nhân Nghĩa xin đánh một trận để quyết được thua, theo gương Đường Thái Tông và Chu Công Đán. Quân của ba vương đánh đến rất gấp, Thái tử bèn sai vệ sĩ trong cung mở cửa ra đánh. Lê Phụng Hiểu sức khỏe hơn người, một mình vượt hơn trăm quân lính, ra trước cửa Quảng Phúc xông thẳng đến chỗ ngựa của Vũ Đức vương. Vương quay ngựa tránh, ngựa quỵ xuống, bị Phụng Hiểu bắt giết. Phủ binh của ba vương thua chạy. Quan quân đuổi theo chém giết hết, chỉ có hai vương Đông Chinh và Dực Thánh chạy thoát được. Thái tử Phật Mã lên ngôi, tức là Lý Thái Tông, đổi niên hiệu là Thiên Thành. Hai vương chạy thoát sau đó được tha tội. Cũng vì biến loạn này, để ngăn ngừa về sau, Lý Thái Tông đặt ra Hội thề thần Đồng Cổ, là một buổi lễ thề rất quan trọng suốt triều đại nhà Lý. Ông xuống chiếu giao cho Hữu ty dựng miếu ở bên phải thành Đại La sau chùa Thánh Thọ, lấy ngày 25 tháng ấy, đắp đàn ở trong miếu, cắm cờ xí, chỉnh đốn đội ngũ, treo gươm giáo ở trước thần vị, đọc lời thề rằng: "Làm con bất hiếu, làm tôi bất trung, xin thần minh giết chết". Các quan từ cửa đông đi vào, đến trước thần vị cùng uống máu ăn thề, hàng năm lấy làm lệ thường. Sau vì tháng 3 có ngày quốc kỵ, chuyển sang mồng 4 tháng 4. Nếu không có mặt trong buổi lễ, người bị tội sẽ bị đánh 50 trượng.',
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
