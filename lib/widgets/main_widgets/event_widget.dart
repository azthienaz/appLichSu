import 'package:flutter/material.dart';
import 'package:applichsu/model/event_model.dart';


class EventWidget extends StatelessWidget {
  const EventWidget({
    super.key,
    required this.eventModel,
    required this.onSelectEventModel,
  });

  final EventModel eventModel;
  final void Function(int index) onSelectEventModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            onSelectEventModel(eventModel.index);
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
                Center(child: Image(image: eventModel.image, width: 129)),
                const SizedBox(height: 5),
                Text(
                  eventModel.title,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  eventModel.time,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
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
