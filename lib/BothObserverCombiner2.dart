import 'package:flutter/widgets.dart';
import 'Holder.dart';

class BothObserverCombiner2<A, B, C, D, E> extends ChangeNotifier {
  Holder<A, B> observerA;
  Holder<C, D> observerB;

  E get value => _value;
  E _value;
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

  BothObserverCombiner2.combine(
      Holder<A, B> a, Holder<C, D> b, E Function(A, B, C, D) map) {
    observerA = a;
    observerB = b;
    value = map(a.object, a.result, b.object, b.result);

    a.subscribeBoth((o, s) {
      value = map(o, s, b.object, b.result);
    });

    b.subscribeBoth((o, s) {
      value = map(a.object, a.result, o, s);
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

  void subscribeResult(Function(E value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
