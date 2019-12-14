import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ObjectObserverCombiner5<A, B, C, D, E, F> extends ChangeNotifier {
  Holder<A, dynamic> observerA;
  Holder<B, dynamic> observerB;
  Holder<C, dynamic> observerC;
  Holder<D, dynamic> observerD;
  Holder<E, dynamic> observerE;

  F _value;
  F get value => _value;
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

  ObjectObserverCombiner5.combine(
      Holder<A, dynamic> a,
      Holder<B, dynamic> b,
      Holder<C, dynamic> c,
      Holder<D, dynamic> d,
      Holder<E, dynamic> e,
      F Function(A, B, C, D, E) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;

    value = map(a.object, b.object, c.object, d.object, e.object);

    a.subscribeObject((v) {
      value = map(v, b.object, c.object, d.object, e.object);
    });

    b.subscribeObject((v) {
      value = map(a.object, v, c.object, d.object, e.object);
    });

    c.subscribeObject((v) {
      value = map(a.object, b.object, v, d.object, e.object);
    });

    d.subscribeObject((v) {
      value = map(a.object, b.object, c.object, v, e.object);
    });

    e.subscribeObject((v) {
      value = map(a.object, b.object, c.object, d.object, v);
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

  void subscribeResult(Function(F value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
