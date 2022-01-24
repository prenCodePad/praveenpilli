import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String assetName;
  const Photo({Key? key, required this.assetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: height * 0.2,
      height: height * 0.2,
      child: CircleAvatar(
        foregroundImage: AssetImage(assetName),
        // minRadius: 40,
      ),
    );
  }
}
