import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  final String vid;
  const VideoPage(this.vid);
  @override
  _VideoPageState createState() => _VideoPageState();
}
class _VideoPageState extends State<VideoPage>{
  late VideoPlayerController _videoPlayerController;
  @override
  void initState(){
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        widget.vid
      )..initialize().then((_){
        setState(() {

        });
      });
  }

  @override
  void dispose(){
    _videoPlayerController.dispose();
    super.dispose();
    
  }

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
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:  Center(
            child: _videoPlayerController.value.isInitialized ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController)
                  ),
                  const Padding(padding: EdgeInsets.all(20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all <Color> (Colors.blue),
                          fixedSize: WidgetStateProperty.all(const Size(70, 70)),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _videoPlayerController.pause();
                        },
                        child: const Icon(Icons.pause),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all <Color> (Colors.red),
                          fixedSize: WidgetStateProperty.all <Size> (const Size(70, 70)),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _videoPlayerController.play();
                        },
                        child: const Icon(Icons.play_arrow),
                      ),
                      const Padding(padding: EdgeInsets.all(4)),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all <Color> (Colors.blue),
                          fixedSize: WidgetStateProperty.all <Size> (const Size(70, 70)),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Duration currentPosition = _videoPlayerController.value.position;
                          Duration targetPosition = currentPosition + const Duration(seconds: 2);
                          _videoPlayerController.seekTo(targetPosition);
                        },
                        child: const Icon(Icons.fast_forward),
                      ),
                    ],
                  ),
                ],
              ) 
              : 
              Container(),
            ),
          ),
      ),
    );
  }
}
