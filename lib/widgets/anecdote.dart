import 'package:flutter/material.dart';
import 'package:applichsu/model/anecdote_model.dart';


class AnecdoteWidget extends StatelessWidget {
  const AnecdoteWidget({
    super.key,
    required this.anecdoteModel,
    required this.onSelectAnecdoteModel,
  });

  final AnecdoteModel anecdoteModel;
  final void Function() onSelectAnecdoteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: onSelectAnecdoteModel,
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
                Center(child: Image(image: anecdoteModel.image, width: 180)),
                const SizedBox(height: 5),
                Text(
                  anecdoteModel.title,
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
