import 'package:flutter/material.dart';
import 'package:applichsu/model/period_details_model.dart';


class BaDoiHoKhucWidget extends StatelessWidget {
  const BaDoiHoKhucWidget({
    super.key,
    required this.badoihokhucModel,
    required this.onSelectBaDoiHoKhucModel,
  });

  final PeriodDetailsModel badoihokhucModel;
  final void Function(int index) onSelectBaDoiHoKhucModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            onSelectBaDoiHoKhucModel(badoihokhucModel.index);
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
                Center(child: Image(image: badoihokhucModel.image, width: 160)),
                const SizedBox(height: 5),
                Text(
                  badoihokhucModel.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  badoihokhucModel.time,
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
