import 'package:flutter_app/app/locator.dart';
import 'package:flutter_app/domain/model/action.dart';
import 'package:flutter_app/domain/repository/action_repository.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  final ActionRepository _actionRepository = locator<ActionRepository>();

  MainViewModel() {
    getAction();
  }

  Action? _action;

  Action? get action => _action;

  void getAction() => _actionRepository.getAction().listen((action) {
        _action = action;
        notifyListeners();
      });
}
