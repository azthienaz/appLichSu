import 'package:flutter/material.dart';
import 'package:applichsu/model/period_details_model.dart';


class BacThuoc2Widget extends StatelessWidget {
  const BacThuoc2Widget({
    super.key,
    required this.bacthuoc2Model,
    required this.onSelectBacThuoc2Model,
  });

  final PeriodDetailsModel bacthuoc2Model;
  final void Function(int index) onSelectBacThuoc2Model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            onSelectBacThuoc2Model(bacthuoc2Model.index);
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
                Center(child: Image(image: bacthuoc2Model.image, width: 160)),
                const SizedBox(height: 5),
                Text(
                  bacthuoc2Model.title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  bacthuoc2Model.time,
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
