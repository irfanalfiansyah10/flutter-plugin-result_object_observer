import 'package:flutter/widgets.dart';

import 'Holder.dart';

class ResultObserverCombiner3<A, B, C, D> extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;
  Holder<dynamic, C> observerC;

  get value => _value;
  D _value;
  set value(D newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ResultObserverCombiner3.combine(Holder<dynamic, A> a, Holder<dynamic, B> b,
      Holder<dynamic, C> c, D Function(A, B, C) map) {
    observerA = a;
    observerB = b;
    observerC = c;

    value = map(a.subscriber, b.subscriber, c.subscriber);

    a.subscribeResult((v) {
      value = map(v, b.subscriber, c.subscriber);
    });

    b.subscribeResult((v) {
      value = map(a.subscriber, v, c.subscriber);
    });

    c.subscribeObject((v) {
      value = map(a.subscriber, b.subscriber, v);
    });
  }

  void subscribeA(Function(A value) subscriber) {
    observerA.subscribeResult((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber) {
    observerB.subscribeResult((value) => subscriber(value));
  }

  void subscribeC(Function(C value) subscriber) {
    observerC.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(D value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
