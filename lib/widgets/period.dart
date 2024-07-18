import 'package:flutter/material.dart';
import 'package:applichsu/model/period_model.dart';


class PeriodWidget extends StatelessWidget {
  const PeriodWidget({
    super.key,
    required this.periodModel,
    required this.onSelectPeriodModel,
  });

  final PeriodModel periodModel;
  final void Function() onSelectPeriodModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: onSelectPeriodModel,
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(2),
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
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
                Image(image: periodModel.image, height: 100),
                const SizedBox(height: 5),
                Text(
                  periodModel.period,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  periodModel.time,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
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
