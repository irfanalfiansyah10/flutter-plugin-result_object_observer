import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ResultObserverCombiner7<A, B, C, D, E, F, G, H> extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;
  Holder<dynamic, C> observerC;
  Holder<dynamic, D> observerD;
  Holder<dynamic, E> observerE;
  Holder<dynamic, F> observerF;
  Holder<dynamic, G> observerG;

  H _value;
  H get value => _value;
  set value(H newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ResultObserverCombiner7.combine(
      Holder<dynamic, A> a,
      Holder<dynamic, B> b,
      Holder<dynamic, C> c,
      Holder<dynamic, D> d,
      Holder<dynamic, E> e,
      Holder<dynamic, F> f,
      Holder<dynamic, G> g,
      H Function(A, B, C, D, E, F, G) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;
    observerG = g;

    value = map(
        a.result, b.result, c.result, d.result, e.result, f.result, g.result);

    a.subscribeObject((v) {
      value =
          map(v, b.result, c.result, d.result, e.result, f.result, g.result);
    });

    b.subscribeObject((v) {
      value =
          map(a.result, v, c.result, d.result, e.result, f.result, g.result);
    });

    c.subscribeObject((v) {
      value =
          map(a.result, b.result, v, d.result, e.result, f.result, g.result);
    });

    d.subscribeObject((v) {
      value =
          map(a.result, b.result, c.result, v, e.result, f.result, g.result);
    });

    e.subscribeObject((v) {
      value =
          map(a.result, b.result, c.result, d.result, v, f.result, g.result);
    });

    f.subscribeObject((v) {
      value =
          map(a.result, b.result, c.result, d.result, e.result, v, g.result);
    });

    g.subscribeObject((v) {
      value =
          map(a.result, b.result, c.result, d.result, e.result, f.result, v);
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

  void subscribeE(Function(E value) subscriber) {
    observerE.subscribeObject((val) => subscriber(val));
  }

  void subscribeF(Function(F value) subscriber) {
    observerF.subscribeObject((val) => subscriber(val));
  }

  void subscribeG(Function(G value) subscriber) {
    observerG.subscribeObject((val) => subscriber(val));
  }

  void subscribeResult(Function(H value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
