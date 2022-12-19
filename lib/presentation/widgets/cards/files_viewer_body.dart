import 'dart:io';

import 'package:bingo_wholesale/const/all_const.dart';
import 'package:bingo_wholesale/const/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../../../app/locator.dart';
import '../../../services/navigation/navigationService.dart';
import '../alert/image_viewer.dart';

class FilesViewerBody extends StatelessWidget {
  FilesViewerBody(this.files, {Key? key}) : super(key: key);
  var _navigationService = locator<NavigationService>();
  // List d = [
  //   "image/image.png",
  //   "image/image.pdf",
  //   "image/image.jpg",
  // ];
  List<File> files;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0.wp,
      child: Wrap(
        runSpacing: 10,
        children: [
          for (var data in files)
            SizedBox(
              height: 100.0,
              child: p.extension(data.path).replaceAll(".", "") == "pdf"
                  ? Image.asset(AppAsset.pdfImage)
                  : p.extension(data.path).replaceAll(".", "") == "png"
                      ? GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            viewImage(data.path, true);
                          },
                          child: Image.asset(AppAsset.pngImage),
                        )
                      : GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            viewImage(data.path, true);
                          },
                          child: Image.asset(AppAsset.jpgImage),
                        ),
            ),
        ],
      ),
    );
  }

  void viewImage(String image, bool isfile) {
    _navigationService.animatedDialog(ImageViewer(
      image: image,
      isFile: isfile,
    ));
  }
}
