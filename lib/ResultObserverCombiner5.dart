import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ResultObserverCombiner5<A, B, C, D, E, F> extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;
  Holder<dynamic, C> observerC;
  Holder<dynamic, D> observerD;
  Holder<dynamic, E> observerE;

  F _value;
  get value => _value;
  set value(F newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ResultObserverCombiner5.combine(
      Holder<dynamic, A> a,
      Holder<dynamic, B> b,
      Holder<dynamic, C> c,
      Holder<dynamic, D> d,
      Holder<dynamic, E> e,
      F Function(A, B, C, D, E) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;

    value = map(
        a.subscriber, b.subscriber, c.subscriber, d.subscriber, e.subscriber);

    a.subscribeResult((v) {
      value = map(v, b.subscriber, c.subscriber, d.subscriber, e.subscriber);
    });

    b.subscribeResult((v) {
      value = map(a.subscriber, v, c.subscriber, d.subscriber, e.subscriber);
    });

    c.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, v, d.subscriber, e.subscriber);
    });

    d.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, v, e.subscriber);
    });

    e.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, v);
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

  void subscribeE(Function(E value) subscriber) {
    observerE.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(F value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
