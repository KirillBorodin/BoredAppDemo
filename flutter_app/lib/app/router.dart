
import 'package:flutter_app/presentation/view/main_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: MainView, initial: true),
  ],
)
class $AppRouter {}
