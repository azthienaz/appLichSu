import 'package:applichsu/screens/detail_screens/anecdote_details1_page.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details2_page.dart';
import 'package:applichsu/screens/detail_screens/anecdote_details3_page.dart';
import 'package:applichsu/screens/detail_screens/event_details1_page.dart';
import 'package:applichsu/screens/detail_screens/event_details2_page.dart';
import 'package:applichsu/screens/detail_screens/event_details3_page.dart';
import 'package:applichsu/screens/main_screens/today_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details1_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details2_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details3_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details4_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details5_page.dart';
import 'package:applichsu/screens/detail_screens/museum_details6_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/bacthuoc_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/codai_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/duongdinhnghe_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/kieucongtien_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/quanchu_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/aulac_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/cuoidonghan_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/dinhbolinh_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/dinhphede_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/khuchao_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/khucthuadu_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/khucthuamy_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/lehoan_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/lelongdinh_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/loan12_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/loantamvuong_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/lynamde_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/lyphattu_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/lythaito_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/ngoquyen_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/nhadongngo_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/nhahan_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/nhatrieu_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/suyvong_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/thinhtri_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/thoiduong_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/thoiluongtannambactrieu_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/thoitamquocvanhahosy_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/thoituy_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/tranhchap_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/trieuvietvuong_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/trungsuy_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/detail_detail_detail_screens/vanlang_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/trungnuvuong_page.dart';
import 'package:applichsu/screens/detail_screens/detail_detail_screens/tuchu_page.dart';
import 'package:flutter/material.dart';
import 'package:applichsu/data/search_data.dart';
import 'package:applichsu/widgets/main_widgets/search_widget.dart';
import 'package:applichsu/constants/screen_index.dart';
import 'package:applichsu/home_bottombar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  _SearchPageState createState() => _SearchPageState();
}
class _SearchPageState extends State<SearchPage>{

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

  void onSelectSearchModel(int index){
    if(index == 1){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails1Page()),
      );
    }
    else if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails2Page()),
      );
    }
    else if(index == 3){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails3Page()),
      );
    }
    else if(index == 4){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails4Page()),
      );
    }
    else if(index == 5){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails5Page()),
      );
    }
    else if(index == 6){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MuseumDetails6Page()),
      );
    }
    else if(index == 7){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AnecdoteDetails1Page()),
      );
    }
    else if(index == 8){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AnecdoteDetails2Page()),
      );
    }
    else if(index == 9){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AnecdoteDetails3Page()),
      );
    }
    else if(index == 10){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TodayPage()),
      );
    }
    else if(index == 11){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EventDetails1Page()),
      );
    }
    else if(index == 12){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EventDetails2Page()),
      );
    }
    else if(index == 13){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const EventDetails3Page()),
      );
    }
    else if(index == 14){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CoDaiPage()),
      );
    }
    else if(index == 15){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BacThuocPage()),
      );
    }
    else if(index == 16){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TuChuPage()),
      );
    }
    else if(index == 17){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuanChuPage()),
      );
    }
    else if(index == 18){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DuongDinhNghePage()),
      );
    }
    else if(index == 19){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KieuCongTienPage()),
      );
    }
    else if(index == 20){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrungNuVuongPage()),
      );
    }
    else if(index == 21){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuLacPage()),
      );
    }
    else if(index == 22){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CuoiDongHanPage()),
      );
    }
    else if(index == 23){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DinhBoLinhPage()),
      );
    }
    else if(index == 24){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DinhPheDePage()),
      );
    }
    else if(index == 25){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KhucHaoPage()),
      );
    }
    else if(index == 26){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KhucThuaDuPage()),
      );
    }
    else if(index == 27){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const KhucThuaMyPage()),
      );
    }
    else if(index == 28){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LeHoanPage()),
      );
    }
    else if(index == 29){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LeLongDinhPage()),
      );
    }
    else if(index == 30){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Loan12Page()),
      );
    }
    else if(index == 31){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoanTamVuongPage()),
      );
    }
    else if(index == 32){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LyNamDePage()),
      );
    }
    else if(index == 33){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LyPhatTuPage()),
      );
    }
    else if(index == 34){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LyThaiToPage()),
      );
    }
    else if(index == 35){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NgoQuyenPage()),
      );
    }
    else if(index == 36){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NhaDongNgoPage()),
      );
    }
    else if(index == 37){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NhaHanPage()),
      );
    }
    else if(index == 38){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NhaTrieuPage()),
      );
    }
    else if(index == 39){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SuyVongPage()),
      );
    }
    else if(index == 40){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThinhTriPage()),
      );
    }
    else if(index == 41){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThoiDuongPage()),
      );
    }
    else if(index == 42){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThoiLuongTanNamBacTrieuPage()),
      );
    }
    else if(index == 43){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThoiTamQuocVaNhaHoSyPage()),
      );
    }
    else if(index == 44){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ThoiTuyPage()),
      );
    }
    else if(index == 45){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TranhChapPage()),
      );
    }
    else if(index == 46){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrieuVietVuongPage()),
      );
    }
    else if(index == 47){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TrungSuyPage()),
      );
    }
    else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VanLangPage()),
      );
    }
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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: (){
                searchData.clear();
                Navigator.of(context).pop();
              },
            ),
            title: const Text(
              'Trang kết quả tìm kiếm',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: searchData.isNotEmpty ?
              Column(
                children: [
                    Expanded(
                      child: GridView(
                        padding: const EdgeInsets.all(20),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 1.4,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 30,
                        ),
                        children: [
                          for(final searchModel in searchData)
                            SearchWidget(
                              searchModel: searchModel,
                              onSelectSearchModel: onSelectSearchModel,
                            ),
                        ],
                      ),
                    ),
                ],
              )
            :
              const Center(
                child: Text(
                  '--- No exist article ---',
                  style: TextStyle(
                    color: Color.fromARGB(255, 61, 60, 60),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
        
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
            currentIndex: ScreenIndex.screenIndex,
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