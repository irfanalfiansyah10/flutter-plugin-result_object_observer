library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ObjectObserver.dart';

class ObjectObserverCombiner8<A, B, C, D, E, F, G, H, I> extends ChangeNotifier{

  ObjectObserver<A, dynamic> _observerA;
  ObjectObserver<B, dynamic> _observerB;
  ObjectObserver<C, dynamic> _observerC;
  ObjectObserver<D, dynamic> _observerD;
  ObjectObserver<E, dynamic> _observerE;
  ObjectObserver<F, dynamic> _observerF;
  ObjectObserver<G, dynamic> _observerG;
  ObjectObserver<H, dynamic> _observerH;

  I _value;
  get value => _value;
  set value(I newValue){
    if(_value == null){
      _value = newValue;
      notifyListeners();
      return;
    }

    if(_value == newValue)
      return;

    _value = newValue;
    notifyListeners();
  }

  ObjectObserverCombiner8.combine(ObjectObserver<A, dynamic> a,
      ObjectObserver<B, dynamic> b,
      ObjectObserver<C, dynamic> c,
      ObjectObserver<D, dynamic> d,
      ObjectObserver<E, dynamic> e,
      ObjectObserver<F, dynamic> f,
      ObjectObserver<G, dynamic> g,
      ObjectObserver<H, dynamic> h,
      I Function(A, B, C, D, E, F, G, H) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;
    _observerD = d;
    _observerE = e;
    _observerF = f;
    _observerG = g;
    _observerH = h;

    value = map(a.value, b.value, c.value, d.value, e.value, f.value, g.value, h.value);

    a.subscribeObject((v){
      value = map(v, b.value, c.value, d.value, e.value, f.value, g.value, h.value);
    });

    b.subscribeObject((v){
      value = map(a.value, v, c.value, d.value, e.value, f.value, g.value, h.value);
    });

    c.subscribeObject((v){
      value = map(a.value, b.value, v, d.value, e.value, f.value, g.value, h.value);
    });

    d.subscribeObject((v){
      value = map(a.value, b.value, c.value, v, e.value, f.value, g.value, h.value);
    });

    e.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, v, f.value, g.value, h.value);
    });

    f.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, e.value, v, g.value, h.value);
    });

    g.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, e.value, f.value, v, h.value);
    });

    h.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, e.value, f.value, g.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    _observerA.subscribeObject((val) => subscriber(val));
  }

  void subscribeB(Function(B value) subscriber){
    _observerB.subscribeObject((val) => subscriber(val));
  }

  void subscribeC(Function(C value) subscriber){
    _observerC.subscribeObject((val) => subscriber(val));
  }

  void subscribeD(Function(D value) subscriber){
    _observerD.subscribeObject((val) => subscriber(val));
  }

  void subscribeE(Function(E value) subscriber){
    _observerE.subscribeObject((val) => subscriber(val));
  }

  void subscribeF(Function(F value) subscriber){
    _observerF.subscribeObject((val) => subscriber(val));
  }

  void subscribeG(Function(G value) subscriber){
    _observerG.subscribeObject((val) => subscriber(val));
  }

  void subscribeH(Function(H value) subscriber){
    _observerH.subscribeObject((val) => subscriber(val));
  }

  void subscribeResult(Function(I value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}