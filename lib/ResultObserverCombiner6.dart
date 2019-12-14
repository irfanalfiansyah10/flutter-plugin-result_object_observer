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
  G get value => _value;
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

    value = map(a.result, b.result, c.result, d.result, e.result, f.result);

    a.subscribeResult((v) {
      value = map(v, b.result, c.result, d.result, e.result, f.result);
    });

    b.subscribeResult((v) {
      value = map(a.result, v, c.result, d.result, e.result, f.result);
    });

    c.subscribeResult((v) {
      value = map(a.result, b.result, v, d.result, e.result, f.result);
    });

    d.subscribeResult((v) {
      value = map(a.result, b.result, c.result, v, e.result, f.result);
    });

    e.subscribeResult((v) {
      value = map(a.result, b.result, c.result, d.result, v, f.result);
    });

    f.subscribeResult((v) {
      value = map(a.result, b.result, c.result, d.result, e.result, v);
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
