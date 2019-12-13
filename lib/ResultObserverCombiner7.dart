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
  get value => _value;
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

    value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
        e.subscriber, f.subscriber, g.subscriber);

    a.subscribeObject((v) {
      value = map(v, b.subscriber, c.subscriber, d.subscriber, e.subscriber,
          f.subscriber, g.subscriber);
    });

    b.subscribeObject((v) {
      value = map(a.subscriber, v, c.subscriber, d.subscriber, e.subscriber,
          f.subscriber, g.subscriber);
    });

    c.subscribeObject((v) {
      value = map(a.subscriber, b.subscriber, v, d.subscriber, e.subscriber,
          f.subscriber, g.subscriber);
    });

    d.subscribeObject((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, v, e.subscriber,
          f.subscriber, g.subscriber);
    });

    e.subscribeObject((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, v,
          f.subscriber, g.subscriber);
    });

    f.subscribeObject((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
          e.subscriber, v, g.subscriber);
    });

    g.subscribeObject((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
          e.subscriber, f.subscriber, v);
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
