import 'package:flutter/widgets.dart';

import 'Holder.dart';

class ResultObserverCombiner4<A, B, C, D, E> extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;
  Holder<dynamic, C> observerC;
  Holder<dynamic, D> observerD;

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

  ResultObserverCombiner4.combine(Holder<dynamic, A> a, Holder<dynamic, B> b,
      Holder<dynamic, C> c, Holder<dynamic, D> d, E Function(A, B, C, D) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;

    value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber);

    a.subscribeResult((v) {
      value = map(v, b.subscriber, c.subscriber, d.subscriber);
    });

    b.subscribeResult((v) {
      value = map(a.subscriber, v, c.subscriber, d.subscriber);
    });

    c.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, v, d.subscriber);
    });

    d.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, v);
    });
  }

  void subscribeA(Function(A value) subscriber) {
    observerA.subscribeResult((val) => subscriber(val));
  }

  void subscribeB(Function(B value) subscriber) {
    observerB.subscribeResult((val) => subscriber(val));
  }

  void subscribeC(Function(C value) subscriber) {
    observerC.subscribeResult((val) => subscriber(val));
  }

  void subscribeD(Function(D value) subscriber) {
    observerD.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(E value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
