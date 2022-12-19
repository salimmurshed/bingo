import 'dart:io';

import 'package:bingo_wholesale/const/all_const.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({super.key, this.image = "", this.isFile = false});
  final String image;
  final bool isFile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            color: Colors.red,
            height: 70.0.hp,
            width: 80.0.wp,
            child: isFile
                ? Image.file(
                    File(image),
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.clear,
                size: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
