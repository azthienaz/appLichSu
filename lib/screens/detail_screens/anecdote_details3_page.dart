import 'package:applichsu/screens/constant_screens/video_page.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/model/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/home_bottombar.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/data/bookmark_data.dart';

class AnecdoteDetails3Page extends StatefulWidget {
  const AnecdoteDetails3Page({super.key});
  @override
  _AnecdoteDetails3PageState createState() => _AnecdoteDetails3PageState();
}
class _AnecdoteDetails3PageState extends State<AnecdoteDetails3Page>{
  int _screenIndex = 2;
  var bm = const BookmarkModel(
    index: 9,
    image: AssetImage('assets/images/anecdote3.png'),
    title: "Chiến tướng đan sọt Phạm Ngũ Lão",
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
              const Image(image: AssetImage('assets/images/anecdote3.png')),
              const SizedBox(height: 8,),
              const Text(
                "Chiến tướng đan sọt Phạm Ngũ Lão",
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
                        MaterialPageRoute(builder: (context) => const VideoPage('assets/videos/anecdote3.mp4')),
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
                      'Theo cuốn Danh nhân Việt Nam, Phạm Ngũ Lão sinh năm 1255 trong một gia đình nông dân nghèo ở làng Phù Ủng, huyện Đường Hào, Hải Dương (nay là thuộc huyện Ân Thi, Hưng Yên) đúng vào lúc vương triều Trần đang động viên sức dân chuẩn bị cho cuộc kháng chiến chống quân Nguyên Mông lần thứ hai. Từ nhỏ, Phạm Ngũ Lão nổi tiếng vì chí khí khác thường. Ở làng có người tên Bùi Công Tiến đỗ tiến sĩ, tổ chức ăn khao, cả làng kéo đến, riêng Phạm Ngũ Lão thì không. Người mẹ hỏi con sao không đến thì Ngũ Lão thưa "Chí làm trai phải lập công danh rạng rỡ non sông mà con chưa lập được bằng người, đi mừng người ta nhục lắm".Cùng thời gian đó, Hưng Đạo Vương Trần Quốc Tuấn đưa quân đi tập trận qua làng Phù Ủng. Quân lính nườm nượp kéo đi, tiếng thét tránh đường vang lên ồn ã, nhưng Ngũ Lão vẫn điềm nhiên ngồi đan sọt bên đường như không hề biết. Một người lính bực tức, lấy giáo đâm vào đùi nhưng ông không phản ứng gì. Nghe tiếng ầm ĩ, Hưng Đạo Vương định sai một viên quan hầu cận lên xem việc gì thì tướng Nguyễn Chế Nghĩa tiến lại trước mặt ông, cúi đầu thưa rõ sự việc. Trần Hưng Đạo thấy lạ liền đến trước mặt chàng trai. Thấy người này ước chừng hai mươi tuổi, đầu trần, áo rách, khuôn mặt khôi ngô, một bên đùi bị giáo đâm chảy máu, nhưng vẫn ngồi đan sọt, Hưng Đạo Vương cất giọng hỏi: "Ngươi quê ở đâu, bị giáo đâm thế không biết đau hay sao mà ngồi im thế"? Phạm Ngũ Lão ngước lên, thấy vị tướng dáng uy nghi nhưng vẫn lộ rõ vẻ hiền từ, liền kính cẩn thưa: "Thưa Đức ông, thần họ Phạm, tên Ngũ Lão, quê ở làng Phù Ủng, châu Thượng Hồng. Nhà nghèo, ruộng không có, phải làm nghề đan sọt nuôi mẹ già. Thần mải nghĩ mấy câu trong binh thư nên không biết có quân của Đức ông qua đây, xin Đức ông xá tội". Thấy dáng vẻ và khẩu khí của Phạm Ngũ Lão đường hoàng, Trần Hưng Đạo sai người lấy thuốc đắp vết thương cho ông rồi dò hỏi xem có quan tâm đến việc quân Nguyên Mông sắp tiến vào Đại Việt không. Phạm Ngũ Lão thưa: "Thần tuy ở nơi thôn dã song cũng biết giặc Nguyên Mông lăm le tiến vào nên đã cùng trai tráng trong vùng luyện tập võ nghệ, chờ thời cơ đầu quân". Hưng Đạo Vương nhìn thấy trong một chiếc sọt có quyển sách liền hỏi sách gì, Ngũ Lão kính cẩn dâng lên. Vương hỏi về binh thư, không ngờ ông trả lời rành rọt mọi vấn đề về cách dùng binh, binh chỉ cần tinh chứ không cần nhiều. Hưng Đạo Vương mừng rỡ nói: "Ngươi có chí lớn, ta rất mừng. Hiện ta chiêu mộ quân lính, kén chọn tướng tài. Ta muốn ngươi về Vạn Kiếp giúp ta huấn luyện quân lính, ngươi thấy thế nào”? Phạm Ngũ Lão vui mừng song không đi ngay mà xin phép về thưa lại với mẹ khiến Hưng Đạo Vương xúc động. Sau một thời gian, Ngũ Lão đến quân doanh của Trần Hưng Đạo huấn luyện quân sĩ. Ông còn được Hưng Đạo Vương gả con gái cho. Điều này rất hiếm xảy ra trong vương triều Trần và để làm điều đó một cách thuận tình đạt lý, Trần Quốc Tuấn đã phải giáng con gái Anh Nguyên xuống làm con nuôi. Không chỉ trở thành con rể và được Hưng Đạo Vương kèm cặp, Phạm Ngũ Lão còn có tình bạn đẹp với con út vua Trần Thái Tông là Minh Hiến vương Trần Uất - người ấn tượng với câu chuyện đan sọt bên đường của ông. Năm 1285, khi giặc Nguyên Mông xâm lược Đại Việt lần thứ hai, Phạm Ngũ Lão đương giữ chức Điện tiền chỉ huy sứ, trấn giữ vùng Ải Bắc, đã đem quân phối hợp với các cánh quân của Trần Nhật Duật, Trần Quốc Toản đánh cho giặc đại bại ở Tây Kết, Hàm Tử, Chương Dương, chém đầu Toa Đô và khiến chủ tướng giặc là Thoát Hoan phải bạt vía. Trong cuộc kháng chiến chống quân Nguyên Mông lần thứ ba (1287), có lần Phạm Ngũ Lão được giao nhiệm vụ chặn đánh giặc ở ải Nội Bàng nhằm tiêu diệt đội quân địch do Thoát Hoan cầm đầu trên đường rút chạy. Tên tướng Thoát Hoan ham sống sợ chết luôn tìm cách đẩy tay chân đi đối đầu với Phạm Ngũ Lão, còn hắn định thoát thân bằng hướng khác. Phạm Ngũ Lão biết trước điều đó nên chia quân mai phục hết các ngả đường tắt sang biên giới, khiến tiền quân của Thoát Hoan bị đánh úp bất ngờ, còn hậu quân bị chặn không tiến được. Quân Thoát Hoan đi tới đâu đều vấp phải phục binh của quân Đại Việt và bị tiêu diệt gần hết. Chủ tướng phải trà trộn vào đám tàn quân mới thoát về nước và không dám đặt chân lên Đại Việt thêm lần nào nữa. Năm 1320, Phạm Ngũ Lão mất ở Thăng Long.',
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
