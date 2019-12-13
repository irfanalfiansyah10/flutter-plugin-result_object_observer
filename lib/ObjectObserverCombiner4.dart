import 'package:flutter/widgets.dart';

import 'Holder.dart';

class ObjectObserverCombiner4<A, B, C, D, E> extends ChangeNotifier {
  Holder<A, dynamic> observerA;
  Holder<B, dynamic> observerB;
  Holder<C, dynamic> observerC;
  Holder<D, dynamic> observerD;

  E _value;
  get value => _value;
  set value(E newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ObjectObserverCombiner4.combine(Holder<A, dynamic> a, Holder<B, dynamic> b,
      Holder<C, dynamic> c, Holder<D, dynamic> d, E Function(A, B, C, D) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;

    value = map(a.value, b.value, c.value, d.value);

    a.subscribeObject((v) {
      value = map(v, b.value, c.value, d.value);
    });

    b.subscribeObject((v) {
      value = map(a.value, v, c.value, d.value);
    });

    c.subscribeObject((v) {
      value = map(a.value, b.value, v, d.value);
    });

    d.subscribeObject((v) {
      value = map(a.value, b.value, c.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber) {
    observerA.subscribeObject((val) => subscriber(val));
  }

  void subscribeB(Function(B value) subscriber) {
    observerB.subscribeObject((val) => subscriber(val));
  }

  void subscribeC(Function(C value) subscriber) {
    observerC.subscribeObject((val) => subscriber(val));
  }

  void subscribeD(Function(D value) subscriber) {
    observerD.subscribeObject((val) => subscriber(val));
  }

  void subscribeResult(Function(E value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
