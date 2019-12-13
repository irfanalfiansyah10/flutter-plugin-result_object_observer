import 'package:flutter/widgets.dart';
import 'Holder.dart';

class ObjectObserverCombiner2<A, B, C> extends ChangeNotifier {
  Holder<A, dynamic> observerA;
  Holder<B, dynamic> observerB;

  get value => _value;
  C _value;
  set value(C newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  ObjectObserverCombiner2.combine(
      Holder<A, dynamic> a, Holder<B, dynamic> b, C Function(A, B) map) {
    observerA = a;
    observerB = b;
    value = map(a.value, b.value);

    a.subscribeObject((v) {
      value = map(v, b.value);
    });

    b.subscribeObject((v) {
      value = map(a.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber) {
    observerA.subscribeObject((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber) {
    observerB.subscribeObject((value) => subscriber(value));
  }

  void subscribeResult(Function(C value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
