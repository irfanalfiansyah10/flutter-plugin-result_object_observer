import 'package:flutter/widgets.dart';

class Holder<Object, Result> extends ChangeNotifier {
  final Result Function(Object obj) predictable;

  Object _object;
  Object get object => _object;
  set object(Object newValue) {
    if (_object == null) {
      _object = newValue;
      _result = predictable(_object);
      notifyListeners();
      return;
    }

    if (_object == newValue) return;

    _object = newValue;
    _result = predictable(_object);
    notifyListeners();
  }

  Result _result;
  Result get result => _result;
  set result(Result newValue) {
    if (_result == null) {
      _result = newValue;
      notifyListeners();
      return;
    }

    if (_result == newValue) return;

    _result = newValue;
    notifyListeners();
  }

  Holder(this.predictable, {Result initialResult, Object initialObject}) {
    _result = initialResult;
    _object = initialObject;
  }

  void subscribeResult(Function(Result subscriberValue) subs) {
    addListener(() {
      subs(_result);
    });
  }

  void subscribeObject(Function(Object objectValue) subs) {
    addListener(() {
      subs(_object);
    });
  }

  void subscribeBoth(Function(Object o, Result s) subs) {
    addListener(() {
      subs(_object, _result);
    });
  }

  /// Just in case when you really need it
  void forceNotify() {
    _result = predictable(_object);
    notifyListeners();
  }
}
