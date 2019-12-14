import 'package:flutter/widgets.dart';

import 'Holder.dart';

class ObjectObserverCombiner3<A, B, C, D> extends ChangeNotifier {
  Holder<A, dynamic> observerA;
  Holder<B, dynamic> observerB;
  Holder<C, dynamic> observerC;

  D get value => _value;
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

  ObjectObserverCombiner3.combine(Holder<A, dynamic> a, Holder<B, dynamic> b,
      Holder<C, dynamic> c, D Function(A, B, C) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    value = map(a.object, b.object, c.object);

    a.subscribeObject((v) {
      value = map(v, b.object, c.object);
    });

    b.subscribeObject((v) {
      value = map(a.object, v, c.object);
    });

    c.subscribeObject((v) {
      value = map(a.object, b.object, v);
    });
  }

  void subscribeA(Function(A value) subscriber) {
    observerA.subscribeObject((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber) {
    observerB.subscribeObject((value) => subscriber(value));
  }

  void subscribeC(Function(C value) subscriber) {
    observerC.subscribeObject((value) => subscriber(value));
  }

  void subscribeResult(Function(D value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
