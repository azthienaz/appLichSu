import 'package:flutter/material.dart';
import 'package:applichsu/model/today_model.dart';
import 'package:applichsu/screens/main_screens/today_page.dart';
import 'package:transparent_image/transparent_image.dart';
class TodayWidget extends StatelessWidget {
  const TodayWidget({super.key, required this.todayModel});

  final TodayModel todayModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TodayPage()),
          );
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: todayModel.image,
              fit: BoxFit.cover,
              height: 140,
              width: double.infinity,
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        todayModel.title,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis, // Very long text ...
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        todayModel.name,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis, // Very long text ...
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )     
              ),
            ),
          ],
        ),
      ),
    );

  }
}
