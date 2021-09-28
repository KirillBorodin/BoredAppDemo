import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/presentation/res/colors/colors.dart';
import 'package:flutter_app/presentation/res/strings/strings.dart';
import 'package:flutter_app/presentation/view/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ViewModelBuilder.reactive(
        viewModelBuilder: () => MainViewModel(),
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'BoredApp',
            ),
          ),
          body: Stack(
            children: [
              Center(
                child: Text(
                  'Hello World!',
                  style: TextStyle(
                    color: AppColors.coral,
                    fontSize: 24,
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
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      Strings.whatShouldIdo.toUpperCase(),
                      style: TextStyle(color: AppColors.white),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
