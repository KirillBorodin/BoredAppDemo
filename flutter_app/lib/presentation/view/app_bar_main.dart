import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/presentation/res/colors/colors.dart';

class AppBarMain extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  const AppBarMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? AppBar(
            title: Text(
              'BoredAppFlutter',
            ),
          )
        : CupertinoNavigationBar(
            middle: Text(
              'BoredAppFlutter',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
            backgroundColor: AppColors.blue,
          );
  }

  @override
  Size get preferredSize => Size(
        Platform.isAndroid
            ? AppBar().preferredSize.width
            : CupertinoNavigationBar().preferredSize.width,
        Platform.isAndroid
            ? AppBar().preferredSize.height
            : CupertinoNavigationBar().preferredSize.height,
      );

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}
