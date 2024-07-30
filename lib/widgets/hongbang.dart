import 'package:flutter/material.dart';
import 'package:applichsu/model/period_details_model.dart';


class HongBangWidget extends StatelessWidget {
  const HongBangWidget({
    super.key,
    required this.hongbangModel,
    required this.onSelectHongBangModel,
  });

  final PeriodDetailsModel hongbangModel;
  final void Function(int index) onSelectHongBangModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            onSelectHongBangModel(hongbangModel.index);
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
                Center(child: Image(image: hongbangModel.image, width: 160)),
                const SizedBox(height: 5),
                Text(
                  hongbangModel.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  hongbangModel.time,
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
