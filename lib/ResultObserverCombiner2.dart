import 'package:flutter/widgets.dart';

import 'Holder.dart';

class ResultObserverCombiner2<A, B, C> extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;

  C get value => _value;
  C _value;
  set value(C newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ResultObserverCombiner2.combine(
      Holder<dynamic, A> a, Holder<dynamic, B> b, C Function(A, B) map) {
    observerA = a;
    observerB = b;
    value = map(a.result, b.result);

    a.subscribeResult((v) {
      value = map(v, b.result);
    });

    b.subscribeResult((v) {
      value = map(a.result, v);
    });
  }

  void subscribeA(Function(A value) subscriber) {
    observerA.subscribeResult((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber) {
    observerB.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(C value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
