import 'package:flutter/material.dart';
import 'package:applichsu/screens/screen_details/anecdote_details2.dart';
class ContactPage extends StatefulWidget {
  const ContactPage({super.key});
  _ContactPageState createState() => _ContactPageState();
}
class _ContactPageState extends State<ContactPage>{
  void _onItemTapped(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AnecdoteDetails2Page()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(left: 28.0),
            child: Text(
              'Liên hệ tác giả',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Image(image: AssetImage('assets/images/contact1.png'), height: 250, width: double.infinity)
                    ),
                    SizedBox(width: 5),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        'Nhóm tác giả trường THCS Bùi Dực Tài',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        'Trong quá trình sưu tầm, biên tập các tư liệu lịch sử sẽ không tránh khỏi những thiếu sót, nhóm tác giả chúng tôi rất mong nhận được sự góp ý từ quý chuyên gia, quý thầy cô giáo, cùng các bạn.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 2),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        'Mỗi ý kiến đóng góp sẽ là động lực để chúng tôi hoàn thiện hơn Ứng dụng, cũng như góp 1 chút công sức của mình vào việc hỗ trợ các bạn hiểu hơn về Lịch sử của dân tộc Việt Nam ta.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Text(
                      'Xin chân thành cảm ơn!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(('assets/images/contact2.png'), width: 50, height: 50),
              label: "",
            ),
            const BottomNavigationBarItem(
              icon: Column(
                children: [
                  Text(
                    'Thầy Hoàng Ngọc Sơn',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height:3),
                  Text(
                    'Giáo viên hướng dẫn',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Container(
                  color: Colors.white, 
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AnecdoteDetails2Page()),
                        );
                    },
                    icon: const Icon(Icons.email, color: Color.fromARGB(255, 204, 123, 2),),
                  ),
                ),
              label: "",
            ),
            
          ],
          onTap: _onItemTapped,
        ),
        
      ),
    );
  }
}
