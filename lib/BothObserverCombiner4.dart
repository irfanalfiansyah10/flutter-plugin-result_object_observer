import 'package:flutter/widgets.dart';
import 'Holder.dart';

class BothObserverCombiner4<A, B, C, D, E, F, G, H, I> extends ChangeNotifier {
  Holder<A, B> observerA;
  Holder<C, D> observerB;
  Holder<E, F> observerC;
  Holder<G, H> observerD;

  I get value => _value;
  I _value;
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

  BothObserverCombiner4.combine(Holder<A, B> a, Holder<C, D> b, Holder<E, F> c,
      Holder<G, H> d, I Function(A, B, C, D, E, F, G, H) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;

    value = map(a.object, a.result, b.object, b.result, c.object, c.result,
        d.object, d.result);

    a.subscribeBoth((o, s) {
      value =
          map(o, s, b.object, b.result, c.object, c.result, d.object, d.result);
    });

    b.subscribeBoth((o, s) {
      value =
          map(a.object, a.result, o, s, c.object, c.result, d.object, d.result);
    });

    c.subscribeBoth((o, s) {
      value =
          map(a.object, a.result, b.object, b.result, o, s, d.object, d.result);
    });

    d.subscribeBoth((o, s) {
      value =
          map(a.object, a.result, b.object, b.result, c.object, c.result, o, s);
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

  void subscribeDObject(Function(G value) subscriber) {
    observerD.subscribeObject((value) => subscriber(value));
  }

  void subscribeDResult(Function(H value) subscriber) {
    observerD.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(I value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
