import 'package:flutter/material.dart';

class ConstantVideoPage extends StatefulWidget {
  const ConstantVideoPage({super.key});
  @override
  _ConstantVideoPageState createState() => _ConstantVideoPageState();
}
class _ConstantVideoPageState extends State<ConstantVideoPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 224, 224, 224), Colors.white])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: const Padding(
          padding: const EdgeInsets.all(20),
          child:  Center(
            child: Image(
              image: AssetImage('assets/images/video.png'), 
              width: double.infinity, 
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
