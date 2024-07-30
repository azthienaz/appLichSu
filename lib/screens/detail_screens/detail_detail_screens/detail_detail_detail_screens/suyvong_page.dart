import 'package:applichsu/data/search_data.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';
import 'package:applichsu/model/bookmark_model.dart';

class SuyVongPage extends StatefulWidget {
  const SuyVongPage({super.key});
  @override
  _SuyVongPageState createState() => _SuyVongPageState();
}
class _SuyVongPageState extends State<SuyVongPage>{
  int _screenIndex = 0;
  static var bookmarked = false;

  var bm = const BookmarkModel(
    index: 39,
    image: AssetImage('assets/images/suyvong.png'),
    title: "Thời suy vong",
  );

  void _onItemTapped(int index) {
    setState(() {
      ScreenIndex.screenIndex = index;
      searchData.clear();
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
            'Thời suy vong',
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
              Image(image: AssetImage('assets/images/suyvong.png')),
              SizedBox(height: 8,),
              Text(
                "1175 - 1225",
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
                      'Lý Cao Tông lên ngôi khi mới 3 tuổi, mẹ là Đỗ phu nhân trở thành Chiêu Thiên Chí Lý Hoàng thái hậu, Đỗ An Di em trai bà trở thành ngoại thích, Tô Hiến Thành được giao cho việc kèm cặp phụ chính. Chiêu Linh Hoàng thái hậu, mẹ của thái tử cũ Lý Long Xưởng cố giành lại ngôi báu cho con trai nhưng không thành vì thái độ cương quyết của Tô Hiến Thành. Lý Cao Tông trưởng thành chỉ thích chơi bời, cho mua bán chức tước, khiến xã hội bất ổn, bọn bất tài cứ có nhiều tiền là làm quan gây phiền nhiễu cho dân chúng; lại cho bán tội ngục, tức là nếu có hai người tranh giành nhau về một vật, tài sản giá trị mà hễ có ai dâng tiền bạc thì được lấy tài sản đó về làm của công, không cần qua tra xét gì cả, nên kho bạc tài sản trong cung thì như núi mà dân đói khổ cứ thế kêu than bên ngoài, giặc cướp như ong. Nhiều thủ lĩnh địa phương nhân lúc triều đình trung ương suy yếu cũng ngầm xây dựng lực lượng nổi dậy. Năm 1209, Cao Tông nghe tin Thái tử Sảm tự ý lập triều đình riêng ở Hải Ấp, cho là chống lại mình nên cử Phạm Du huấn luyện binh sĩ ở vùng Hồng mà đi đánh. Nhưng Phạm Du mải tư thông với Thiên Cực công chúa, nên trễ hẹn với bọn Đoàn Thượng, bị thuộc hạ của Thái tử Sảm (thực chất là thuộc hạ họ Trần) mai phục và bắt giết. Sau đó, Trần Lý và em vợ là Tô Trung Từ đứng đầu cầm quân đánh đến kinh sư, đánh bại Quách Bốc và đồng đảng, dẹp tan loạn Quách Bốc. Cao Tông được rước về kinh thành Thăng Long. Không lâu sau, năm 1210, Cao Tông qua đời lúc 38 tuổi. Thái tử Lý Sảm lên ngôi, tức Lý Huệ Tông, lúc ấy mới 16 tuổi. Huệ Tông cho lão thần Đỗ Kính Chu làm Thái úy phụ chính. Sau khi Tô Trung Từ chết, Huệ Tông dùng cậu là Đàm Dĩ Mông làm Thái úy phụ chính, Đàm thái hậu cũng xen vào việc chính sự. Họ Đàm muốn nhân quyền ngoại thích mà lộng hành, chính sự ngày càng suy. ai lực lượng lớn nhất tranh quyền lúc đó là họ Trần và họ Đoàn. Lý Huệ Tông lo ngại ngoại thích nhà vợ họ Trần thế lực lớn, nên cùng ngoại thích nhà mẹ là cậu Đàm Dĩ Mông muốn dựa vào họ Đoàn. Nghe họ Đoàn gièm pha Trần Tự Khánh muốn phế lập, Huệ Tông tức giận hạ chiếu cho các đạo binh đánh Trần Tự Khánh, và giáng Trần Thị Dung xuống làm Ngự nữ. Năm 1223, Thái úy Trần Tự Khánh qua đời, Huệ Tông lấy Trần Thừa làm Phụ quốc Thái úy, cho đặc quyền khi vào chầu không xưng tên. Lúc đó, Nguyễn Nộn lại bắt đầu mạnh lên, là mối nguy hại cho dòng họ Trần đang nắm giữ triều đình. Năm 1224, bệnh của Huệ Tông ngày càng tăng mà không có con trai để nối nghiệp lớn, các công chúa đều được chia các lộ làm ấp thang mộc, ủy nhiệm cho một mình Chỉ huy sứ Trần Thủ Độ. quản lĩnh các quân điện tiền hộ vệ cấm đình. Con gái thứ 2 là công chúa Chiêu Thánh được lập làm Hoàng thái nữ, rồi làm Hoàng đế, sử gọi là Chiêu Hoàng đế.. Huệ Tông truyền ngôi trở thành Thái thượng hoàng, rồi xuất gia ở chùa Chân Giáo gọi là Huệ Quang thiền sư trong đại nội hoàng cung. Đàm thái hậu cũng theo ông vào đây xuất gia. Điện tiền Chỉ huy sứ Trần Thủ Độ coi giữ mọi việc quân sự trong ngoài thành thị. Trần Cảnh, con trai thứ của Trần Thừa được phong làm Chính thủ, cho hầu hạ gần gũi với Chiêu Hoàng, được Chiêu Hoàng yêu mến. Dưới sự sắp đặt của Trần Thủ Độ, Chiêu Hoàng lấy Trần Cảnh làm chồng, rồi đến tháng 12 âm lịch năm 1225 (đầu năm 1226), ngày mồng một Mậu Dần, Chiêu Hoàng mở hội lớn ở điện Thiên An, trút bỏ áo ngự mời Trần Cảnh lên ngôi Hoàng đế. Cha Trần Cảnh là Trần Thừa được tôn làm Thái thượng hoàng. Ngôi nhà Lý chính thức chuyển sang nhà Trần. Nhà Lý kéo dài 216 năm với 9 đời vua. Không lâu sau, thượng hoàng Huệ Tông bị Trần Thủ Độ bức tự sát ở chùa Chân Giáo.',
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
