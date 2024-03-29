import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ObjectObserverCombiner6<A, B, C, D, E, F, G> extends ChangeNotifier {
  Holder<A, dynamic> observerA;
  Holder<B, dynamic> observerB;
  Holder<C, dynamic> observerC;
  Holder<D, dynamic> observerD;
  Holder<E, dynamic> observerE;
  Holder<F, dynamic> observerF;

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

  ObjectObserverCombiner6.combine(
      Holder<A, dynamic> a,
      Holder<B, dynamic> b,
      Holder<C, dynamic> c,
      Holder<D, dynamic> d,
      Holder<E, dynamic> e,
      Holder<F, dynamic> f,
      G Function(A, B, C, D, E, F) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;

    value = map(a.object, b.object, c.object, d.object, e.object, f.object);

    a.subscribeObject((v) {
      value = map(v, b.object, c.object, d.object, e.object, f.object);
    });

    b.subscribeObject((v) {
      value = map(a.object, v, c.object, d.object, e.object, f.object);
    });

    c.subscribeObject((v) {
      value = map(a.object, b.object, v, d.object, e.object, f.object);
    });

    d.subscribeObject((v) {
      value = map(a.object, b.object, c.object, v, e.object, f.object);
    });

    e.subscribeObject((v) {
      value = map(a.object, b.object, c.object, d.object, v, f.object);
    });

    f.subscribeObject((v) {
      value = map(a.object, b.object, c.object, d.object, e.object, v);
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

  void subscribeResult(Function(G value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
