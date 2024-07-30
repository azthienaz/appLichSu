import 'package:flutter/material.dart';
import 'package:applichsu/model/period_details_model.dart';


class BacThuoc3Widget extends StatelessWidget {
  const BacThuoc3Widget({
    super.key,
    required this.bacthuoc3Model,
    required this.onSelectBacThuoc3Model,
  });

  final PeriodDetailsModel bacthuoc3Model;
  final void Function(int index) onSelectBacThuoc3Model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            onSelectBacThuoc3Model(bacthuoc3Model.index);
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
                Center(child: Image(image: bacthuoc3Model.image, width: 160)),
                const SizedBox(height: 5),
                Text(
                  bacthuoc3Model.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  bacthuoc3Model.time,
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
