import 'package:flutter/widgets.dart';
import 'Holder.dart';

class BothObserverCombiner7<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>
    extends ChangeNotifier {
  Holder<A, B> observerA;
  Holder<C, D> observerB;
  Holder<E, F> observerC;
  Holder<G, H> observerD;
  Holder<I, J> observerE;
  Holder<K, L> observerF;
  Holder<M, N> observerG;

  O get value => _value;
  O _value;
  set value(O newValue) {
    if (_value == null) {
      _value = newValue;
      notifyListeners();
      return;
    }

    if (_value == newValue) return;

    _value = newValue;
    notifyListeners();
  }

  BothObserverCombiner7.combine(
      Holder<A, B> a,
      Holder<C, D> b,
      Holder<E, F> c,
      Holder<G, H> d,
      Holder<I, J> e,
      Holder<K, L> f,
      Holder<M, N> g,
      O Function(A, B, C, D, E, F, G, H, I, J, K, L, M, N) map) {
    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;
    observerG = g;

    value = map(
        a.object,
        a.result,
        b.object,
        b.result,
        c.object,
        c.result,
        d.object,
        d.result,
        e.object,
        e.result,
        f.object,
        f.result,
        g.object,
        g.result);

    a.subscribeBoth((o, s) {
      value = map(o, s, b.object, b.result, c.object, c.result, d.object,
          d.result, e.object, e.result, f.object, f.result, g.object, g.result);
    });

    b.subscribeBoth((o, s) {
      value = map(a.object, a.result, o, s, c.object, c.result, d.object,
          d.result, e.object, e.result, f.object, f.result, g.object, g.result);
    });

    c.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, o, s, d.object,
          d.result, e.object, e.result, f.object, f.result, g.object, g.result);
    });

    d.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result, o,
          s, e.object, e.result, f.object, f.result, g.object, g.result);
    });

    e.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result,
          d.object, d.result, o, s, f.object, f.result, g.object, g.result);
    });

    f.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result,
          d.object, d.result, e.object, e.result, o, s, g.object, g.result);
    });

    g.subscribeBoth((o, s) {
      value = map(a.object, a.result, b.object, b.result, c.object, c.result,
          d.object, d.result, e.object, e.result, f.object, f.result, o, s);
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

  void subscribeGObject(Function(M value) subscriber) {
    observerG.subscribeObject((value) => subscriber(value));
  }

  void subscribeGResult(Function(N value) subscriber) {
    observerG.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(O value) subscriber) {
    addListener(() {
      subscriber(_value);
    });
  }
}
