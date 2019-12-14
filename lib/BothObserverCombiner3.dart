import 'package:flutter/widgets.dart';
import 'Holder.dart';

class BothObserverCombiner3<A, B, C, D, E, F, G> extends ChangeNotifier {
  Holder<A, B> observerA;
  Holder<C, D> observerB;
  Holder<E, F> observerC;

  G get value => _value;
  G _value;
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

  BothObserverCombiner3.combine(Holder<A, B> a, Holder<C, D> b, Holder<E, F> c,
      G Function(A, B, C, D, E, F) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    value = map(a.object, a.result, b.object, b.result, c.object, c.result);

    a.subscribeBoth((o, s) {
      value = map(o, s, b.object, b.result, c.object, c.result);
    });

    b.subscribeBoth((o, s) {
      value = map(a.object, a.result, o, s, c.object, c.result);
    });

    c.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, o, s);
    });
  }

  void subscribeAObject(Function(A value) subscriber) {
    observerA.subscribeObject((a) => subscriber(a));
  }

  void subscribeAResult(Function(B value) subscriber) {
    observerA.subscribeResult((b) => subscriber(b));
  }

  void subscribeBObject(Function(C value) subscriber) {
    observerB.subscribeObject((value) => subscriber(value));
  }

  void subscribeBResult(Function(D value) subscriber) {
    observerB.subscribeResult((value) => subscriber(value));
  }

  void subscribeCObject(Function(E value) subscriber) {
    observerC.subscribeObject((value) => subscriber(value));
  }

  void subscribeCResult(Function(F value) subscriber) {
    observerC.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(G value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
