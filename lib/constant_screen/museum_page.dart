import 'package:flutter/material.dart';

class ConstantMuseumPage extends StatefulWidget {
  const ConstantMuseumPage({super.key});
  @override
  _ConstantMuseumPageState createState() => _ConstantMuseumPageState();
}
class _ConstantMuseumPageState extends State<ConstantMuseumPage>{
  static var bookmarked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 221, 156, 58), Color.fromARGB(255, 233, 226, 226)])),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              const SizedBox(width: 17,),
              const Text(
                'Bảo tàng lịch sử',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12,),
              IconButton(
                onPressed: () {
                  setState(() {
                    bookmarked = true;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: bookmarked ? Colors.red : Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        body: const Center(
          child: Text('This is the Constant Museum Page'),
        ),
      ),
    );
  }
}
