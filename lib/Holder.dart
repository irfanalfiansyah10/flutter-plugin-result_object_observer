import 'package:flutter/widgets.dart';

class Holder<Object, Subscriber> extends ChangeNotifier {
  final Subscriber Function(Object obj) predictable;

  Object _value;
  Object get value => _value;
  set value(Object newValue) {
    if (_value == null) {
      _value = newValue;
      _subscriber = predictable(_value);
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    _subscriber = predictable(_value);
    notifyListeners();
  }

  Subscriber _subscriber;
  Subscriber get subscriber => _subscriber;
  set subscriber(Subscriber newValue) {
    if (_subscriber == null) {
      _subscriber = newValue;
      notifyListeners();
      return;
    }

    if (_subscriber == newValue) return;

    _subscriber = newValue;
    notifyListeners();
  }

  Holder(this.predictable, {Subscriber initialResult, Object initialValue}) {
    _subscriber = initialResult;
    _value = initialValue;
  }

  void subscribeResult(Function(Subscriber subscriberValue) subs) {
    addListener(() {
      subs(_subscriber);
    });
  }

  void subscribeObject(Function(Object objectValue) subs) {
    addListener(() {
      subs(_value);
    });
  }

  /// Just in case when you really need it
  void forceNotify() {
    _subscriber = predictable(_value);
    notifyListeners();
  }
}
