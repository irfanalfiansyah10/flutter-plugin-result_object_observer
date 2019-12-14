import 'package:flutter/widgets.dart';
import 'Holder.dart';

class BothObserverCombiner6<A, B, C, D, E, F, G, H, I, J, K, L, M>
    extends ChangeNotifier {
  Holder<A, B> observerA;
  Holder<C, D> observerB;
  Holder<E, F> observerC;
  Holder<G, H> observerD;
  Holder<I, J> observerE;
  Holder<K, L> observerF;

  M get value => _value;
  M _value;
  set value(M newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  BothObserverCombiner6.combine(
      Holder<A, B> a,
      Holder<C, D> b,
      Holder<E, F> c,
      Holder<G, H> d,
      Holder<I, J> e,
      Holder<K, L> f,
      M Function(A, B, C, D, E, F, G, H, I, J, K, L) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;

    value = map(a.object, a.result, b.object, b.result, c.object, c.result,
        d.object, d.result, e.object, e.result, f.object, f.result);

    a.subscribeBoth((o, s) {
      value = map(o, s, b.object, b.result, c.object, c.result, d.object,
          d.result, e.object, e.result, f.object, f.result);
    });

    b.subscribeBoth((o, s) {
      value = map(a.object, a.result, o, s, c.object, c.result, d.object,
          d.result, e.object, e.result, f.object, f.result);
    });

    c.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, o, s, d.object,
          d.result, e.object, e.result, f.object, f.result);
    });

    d.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result, o,
          s, e.object, e.result, f.object, f.result);
    });

    e.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result,
          d.object, d.result, o, s, f.object, f.result);
    });

    f.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result,
          d.object, d.result, e.object, e.result, o, s);
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

  void subscribeEObject(Function(I value) subscriber) {
    observerE.subscribeObject((value) => subscriber(value));
  }

  void subscribeEResult(Function(J value) subscriber) {
    observerE.subscribeResult((value) => subscriber(value));
  }

  void subscribeFObject(Function(K value) subscriber) {
    observerF.subscribeObject((value) => subscriber(value));
  }

  void subscribeFResult(Function(L value) subscriber) {
    observerF.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(M value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
