import 'package:applichsu/constant_screen/video_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_page.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';

class AnecdoteDetails1Page extends StatefulWidget {
  const AnecdoteDetails1Page({super.key});
  @override
  _AnecdoteDetails1PageState createState() => _AnecdoteDetails1PageState();
}
class _AnecdoteDetails1PageState extends State<AnecdoteDetails1Page>{
  int _screenIndex = 2;
  var bm = const BookmarkModel(
    index: 7,
    image: AssetImage('assets/images/anecdote1.png'),
    title: "Giai thoại Mỵ Châu - Trọng Thủy",
  );
  static var bookmarked = false;
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
            'Giai thoại lịch sử',
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
          
            Column(
            children: [
              const Image(image: AssetImage('assets/images/anecdote1.png')),
              const SizedBox(height: 8,),
              const Text(
                "Giai thoại Mỵ Châu - Trọng Thủy",
                textAlign: TextAlign.left,
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 221, 156, 58),
                      textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      
                    ),
                    child: const Text('Xem video', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VideoPage('assets/videos/anecdote1.mp4')),
                      );
                    }, 
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Colors.grey,
                thickness: 2,
                height: 16,
                indent: 5,
                endIndent: 5,
              ),
              const SizedBox(height: 5),
              const Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Sau khi An Dương Vương xây thành Cổ Loa, thần Kim Quy cho An Dương Vương một cái móng của mình để làm lẫy nỏ mà giữ thành. Theo lời thần dặn, nỏ có được cái lẫy làm bằng móng chân thần sẽ là chiếc nỏ bắn trăm phát trúng cả trăm, và chỉ một phát có thể giết hàng ngàn quân địch. An Dương Vương chọn trong đám gia thần được một người làm nỏ rất khéo tên là Cao Lỗ và giao cho Lỗ làm chiếc nỏ thần. Lỗ gắng sức trong nhiều ngày mới xong. Chiếc nỏ rất lớn và rất cứng, khác hẳn với những nỏ thường, phải tay lực sĩ mới giương nổi. An Dương Vương quý chiếc nỏ thần vô cùng, lúc nào cũng treo gần chỗ nằm. Lúc bấy giờ Triệu Đà làm chúa đất Nam Hải, mấy lần đem quân sang cướp đất Âu Lạc, nhưng vì An Dương Vương có nỏ thần, quân Nam Hải bị giết hại rất nhiều nên Đà đành cố thủ đợi chờ thời cơ. Triệu Đà thấy dùng binh không lợi, bèn xin giảng hòa với An Dương Vương, sai con trai là Trọng Thuỷ sang cầu thân, nhưng chủ ý là tìm cách phá chiếc nỏ thần. Trong những ngày đi lại để giả kết tình hoà hiếu, Trọng Thuỷ được gặp Mỵ Châu, con gái yêu của An Dương Vương, một thiếu nữ mày ngài, mắt phượng, nhan sắc tuyệt trần. Trọng Thuỷ đem lòng yêu dấu Mỵ Châu, Mỵ Châu dần dần cũng xiêu lòng. Hai người trở nên thân thiết, không còn chỗ nào trong Loa thành mà Mỵ Châu không dẫn người yêu đến xem. An Dương Vương không nghi kỵ gì cả. Thấy đôi trẻ thương yêu nhau, vua liền gả Mỵ Châu cho Trọng Thuỷ. Một đêm trăng sao vằng vặc, Mỵ Châu cùng Trọng Thuỷ ngồi trên phiến đá trắng giữa vườn, cùng nhau nhìn dãy tường thành cao nhất. Trong câu chuyện tỷ tê, Trọng Thuỷ hỏi vợ rằng: Nàng ơi, bên Âu Lạc có bí quyết gì mà không ai đánh được? Mỵ Châu đáp: Có bí quyết gì đâu chàng, Âu Lạc đã có thành cao, hào sâu, lại có nỏ thần bắn một phát chết hàng nghìn quân địch, như thế còn có kẻ nào đánh nổi được? Trọng Thuỷ làm bộ ngạc nhiên, vờ như mới nghe nói đến nỏ thần lần đầu. Chàng ngỏ ý muốn xem chiếc nỏ. Mỵ Châu không ngần ngại, chạy ngay vào chỗ nằm của cha, lấy nỏ thần đem ra cho chồng xem. Nàng lại chỉ cho chàng biết cái lẫy vốn là chiếc móng chân thần Kim Quy và giảng cho Trọng Thuỷ cách bắn. Trọng Thuỷ chăm chú nghe, chăm chú nhìn cái lẫy, nhìn khuôn khổ cái nỏ hồi lâu, rồi đưa cho vợ cất đi. Hôm sau, Trọng Thủy xin phép An Dương Vương về thăm cha. Hắn thuật lại cho Triệu Đà biết về chiếc nỏ thần. Đà sai một gia nhân chuyên làm nỏ, chế một chiếc lẫy nỏ giống hệt của An Dương Vương. Lẫy giả làm xong, Trọng Thuỷ giấu vào trong áo, lại trở sang Âu Lạc. An Dương Vương vốn chiều con gái, thấy con mỗi khi gặp chồng thì vui vẻ sung sướng, liền sai gia nhân bày tiệc rượu để ba cha con cùng vui. Trọng Thuỷ uống cầm chừng, còn An Dương Vương và Mỵ Châu say tuý luý. Thừa lúc bố vợ say, Trọng Thuỷ lẻn ngay vào phòng tháo lấy cái lẫy bằng móng chân thần Kim Quy và thay cái lẫy giả bằng móng rùa thường vào. Hôm sau, thấy chồng có vẻ bồn chồn, hết đứng lại ngồi không yên, Mỵ Châu hỏi chồng rằng: Chàng như có gì lo lắng phải không? Trọng Thuỷ đáp: Ta sắp phải đi, Phụ vương dặn phải về ngay để còn lên miền Bắc, miền Bắc xa lắm nàng ạ. Mỵ Châu buồn rầu lặng thinh, Trọng Thuỷ nói tiếp: Bây giờ đôi ta sắp phải xa nhau, không biết đến bao giờ gặp lại! Nếu chẳng may xảy ra binh đao, tôi biết đâu mà tìm? Mỵ Châu nói: Thiếp có cái áo lông ngỗng, hễ thiếp chạy về hướng nào thì thiếp sẽ rắc lông ngỗng dọc đường, chàng cứ chạy theo dấu lông ngỗng mà tìm. Nói xong Mỵ Châu nức nở khóc. Về đất Nam Hải, Trọng Thuỷ đưa cái móng rùa vàng cho cha, Triệu Đà mừng rỡ vô cùng, reo lên rằng: “Phen này đất Âu Lạc sẽ về tay ta”. Chỉ ít ngày sau, Triệu Đà đã ra lệnh cất quân sang đánh Âu Lạc. Nghe tin báo, An Dương Vương cậy có nỏ thần, không phòng bị gì cả. Đến khi quân giặc đã đến sát chân thành, An Dương Vương sai đem nỏ thần ra bắn thì không thấy linh nghiệm nữa. Quân Triệu Đà phá cửa thành, ùa vào. An Dương Vương vội lên ngựa, đèo Mỵ Châu sau lưng, phi ngựa thoát ra cửa sau. Ngồi sau lưng cha, Mỵ Châu bứt lông ngỗng ở áo rắc khắp dọc đường. Đường núi gập ghềnh hiểm trở, ngựa chạy luôn mấy ngày đêm đến Dạ Sơn gần bờ biển. Hai cha con định xuống ngựa ngồi nghỉ thì quân giặc đã gần đến. Thấy đường núi quanh co dốc ngược, bóng chiều đã xuống, không còn lối nào chạy, An Dương Vương liền hướng ra biến, khấn thần Kim Quy phù hộ cho mình. Vua vừa khấn xong thì một cơn gió lốc cát bụi bốc lên mù mịt, làm rung chuyển cả núi rừng. Thần Kim Quy xuất hiện, bảo An Dương Vương rằng “giặc ở sau lưng nhà vua đấy”. An Dương Vương tỉnh ngộ, liền rút gươm chém Mỵ Châu, rồi nhảy xuống biểu tự vẫn. Quân của Triệu Đà kéo vào chiếm đóng Loa thành, còn Trọng Thuỷ một mình một ngựa theo dấu lông ngỗng đi tìm Mỵ Châu. Đến gần bờ biển, thấy xác vợ nằm trên đám cỏ, tuy chết mà nhan sắc không mờ phai. Trọng Thuỷ khóc oà lên, thu nhặt thi hài đem về chôn trong thành, rồi đâm đầu xuống giếng trong thành mà xưa kia Mỵ Châu thường tắm. Ngày nay, ở làng cổ Loa, trước đền thờ An Dương Vương, còn cái giếng gọi là giếng Trọng Thuỷ. Tục truyền khi Mỵ Châu đã bị cha giết chết rồi, máu nàng chảy xuống biển, trai ăn được nên mới có ngọc châu. Lấy được ngọc trai ấy đem về rửa bằng nước giếng trong thành Cổ Loa thì ngọc trong sáng vô cùng.',
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
