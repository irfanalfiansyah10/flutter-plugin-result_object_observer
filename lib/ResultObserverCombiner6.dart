import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ResultObserverCombiner6<A, B, C, D, E, F, G> extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;
  Holder<dynamic, C> observerC;
  Holder<dynamic, D> observerD;
  Holder<dynamic, E> observerE;
  Holder<dynamic, F> observerF;

  G _value;
  get value => _value;
  set value(G newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ResultObserverCombiner6.combine(
      Holder<dynamic, A> a,
      Holder<dynamic, B> b,
      Holder<dynamic, C> c,
      Holder<dynamic, D> d,
      Holder<dynamic, E> e,
      Holder<dynamic, F> f,
      G Function(A, B, C, D, E, F) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;

    value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
        e.subscriber, f.subscriber);

    a.subscribeResult((v) {
      value = map(v, b.subscriber, c.subscriber, d.subscriber, e.subscriber,
          f.subscriber);
    });

    b.subscribeResult((v) {
      value = map(a.subscriber, v, c.subscriber, d.subscriber, e.subscriber,
          f.subscriber);
    });

    c.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, v, d.subscriber, e.subscriber,
          f.subscriber);
    });

    d.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, v, e.subscriber,
          f.subscriber);
    });

    e.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, v,
          f.subscriber);
    });

    f.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
          e.subscriber, v);
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

  void subscribeF(Function(F value) subscriber) {
    observerF.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(G value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
