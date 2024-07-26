import 'package:flutter/material.dart';
import 'package:applichsu/model/museum_model.dart';


class MuseumWidget extends StatelessWidget {
  const MuseumWidget({
    super.key,
    required this.museumModel,
    required this.onSelectMuseumModel,
  });

  final MuseumModel museumModel;
  final void Function(int index) onSelectMuseumModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            onSelectMuseumModel(museumModel.index);
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image(image: museumModel.image, width: 170)),
                const SizedBox(height: 5),
                Text(
                  museumModel.title,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
