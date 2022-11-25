import 'package:flutter/material.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

class LoadingDialog extends StatelessWidget {
  final String loadingMessage;
  const LoadingDialog({Key? key, required this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: SizedBox(
          height: 100,
          width: 300,
          child: Card(
            color: scaffoldBackgroundColor,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: 20),
                  Text(
                    loadingMessage,
                    style: const TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
