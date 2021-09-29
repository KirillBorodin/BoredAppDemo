import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/presentation/res/colors/colors.dart';
import 'package:flutter_app/presentation/res/strings/strings.dart';
import 'package:flutter_app/presentation/view/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'app_bar_main.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => MainViewModel(),
        builder: (context, MainViewModel viewModel, child) => Platform.isAndroid
            ? Scaffold(
                appBar: AppBarMain(),
                body: _MainViewContent(
                  action: viewModel.action?.result ?? '',
                  onGetActionClicked: viewModel.getAction,
                ),
              )
            : CupertinoPageScaffold(
                navigationBar: AppBarMain(),
                child: _MainViewContent(
                  action: viewModel.action?.result ?? '',
                  onGetActionClicked: viewModel.getAction,
                ),
              ),
      );
}

class _MainViewContent extends StatelessWidget {
  final String action;
  final VoidCallback onGetActionClicked;

  const _MainViewContent({
    required this.action,
    required this.onGetActionClicked,
  });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                action,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.coral,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 20,
            ),
            child: SizedBox(
                width: double.maxFinite,
                child: _ButtonGetAction(
                  onGetActionClicked: onGetActionClicked,
                )),
          ),
        ],
      );
}

class _ButtonGetAction extends StatelessWidget {
  final VoidCallback onGetActionClicked;

  const _ButtonGetAction({
    required this.onGetActionClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Platform.isAndroid
      ? TextButton(
          onPressed: onGetActionClicked,
          child: Text(
            Strings.whatShouldIdo.toUpperCase(),
            style: TextStyle(color: AppColors.white),
          ),
          style: TextButton.styleFrom(
            backgroundColor: AppColors.blue,
          ),
        )
      : CupertinoButton(
          color: AppColors.blue,
          child: Text(
            Strings.whatShouldIdo.toUpperCase(),
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          onPressed: onGetActionClicked,
        );
}
