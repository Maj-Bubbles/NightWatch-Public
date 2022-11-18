import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nightwatch/miscellaneous/constants.dart';

class MapGoogleR extends StatefulWidget {
  const MapGoogleR({super.key});

  @override
  State<MapGoogleR> createState() => _MapGoogleRState();
}

class _MapGoogleRState extends State<MapGoogleR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Map',
          style: TextStyle(
            color: appBarTitle,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Map Here...',
          style: TextStyle(
            color: appBarTitle,
          ),
        ),
      ),
    );
  }
}
