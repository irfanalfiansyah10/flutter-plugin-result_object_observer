import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ResultObserverCombiner8<A, B, C, D, E, F, G, H, I>
    extends ChangeNotifier {
  Holder<dynamic, A> observerA;
  Holder<dynamic, B> observerB;
  Holder<dynamic, C> observerC;
  Holder<dynamic, D> observerD;
  Holder<dynamic, E> observerE;
  Holder<dynamic, F> observerF;
  Holder<dynamic, G> observerG;
  Holder<dynamic, H> observerH;

  I _value;
  get value => _value;
  set value(I newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ResultObserverCombiner8.combine(
      Holder<dynamic, A> a,
      Holder<dynamic, B> b,
      Holder<dynamic, C> c,
      Holder<dynamic, D> d,
      Holder<dynamic, E> e,
      Holder<dynamic, F> f,
      Holder<dynamic, G> g,
      Holder<dynamic, H> h,
      I Function(A, B, C, D, E, F, G, H) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;
    observerG = g;
    observerH = h;

    value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
        e.subscriber, f.subscriber, g.subscriber, h.subscriber);

    a.subscribeResult((v) {
      value = map(v, b.subscriber, c.subscriber, d.subscriber, e.subscriber,
          f.subscriber, g.subscriber, h.subscriber);
    });

    b.subscribeResult((v) {
      value = map(a.subscriber, v, c.subscriber, d.subscriber, e.subscriber,
          f.subscriber, g.subscriber, h.subscriber);
    });

    c.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, v, d.subscriber, e.subscriber,
          f.subscriber, g.subscriber, h.subscriber);
    });

    d.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, v, e.subscriber,
          f.subscriber, g.subscriber, h.subscriber);
    });

    e.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, v,
          f.subscriber, g.subscriber, h.subscriber);
    });

    f.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
          e.subscriber, v, g.subscriber, h.subscriber);
    });

    g.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
          e.subscriber, f.subscriber, v, h.subscriber);
    });

    h.subscribeResult((v) {
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber,
          e.subscriber, f.subscriber, g.subscriber, v);
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

  void subscribeG(Function(G value) subscriber) {
    observerG.subscribeResult((val) => subscriber(val));
  }

  void subscribeH(Function(H value) subscriber) {
    observerH.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(I value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
