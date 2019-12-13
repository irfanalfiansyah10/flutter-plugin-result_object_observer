import 'package:flutter/widgets.dart';
import 'ObjectObserver.dart';

class ObjectObserverCombiner6<A, B, C, D, E, F, G> extends ChangeNotifier{

  ObjectObserver<A, dynamic> observerA;
  ObjectObserver<B, dynamic> observerB;
  ObjectObserver<C, dynamic> observerC;
  ObjectObserver<D, dynamic> observerD;
  ObjectObserver<E, dynamic> observerE;
  ObjectObserver<F, dynamic> observerF;

  G _value;
  get value => _value;
  set value(G newValue){
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

  ObjectObserverCombiner6.combine(ObjectObserver<A, dynamic> a,
      ObjectObserver<B, dynamic> b,
      ObjectObserver<C, dynamic> c,
      ObjectObserver<D, dynamic> d,
      ObjectObserver<E, dynamic> e,
      ObjectObserver<F, dynamic> f,
      G Function(A, B, C, D, E, F) map){

    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;

    value = map(a.value, b.value, c.value, d.value, e.value, f.value);

    a.subscribeObject((v){
      value = map(v, b.value, c.value, d.value, e.value, f.value);
    });

    b.subscribeObject((v){
      value = map(a.value, v, c.value, d.value, e.value, f.value);
    });

    c.subscribeObject((v){
      value = map(a.value, b.value, v, d.value, e.value, f.value);
    });

    d.subscribeObject((v){
      value = map(a.value, b.value, c.value, v, e.value, f.value);
    });

    e.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, v, f.value);
    });

    f.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, e.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    observerA.subscribeObject((val) => subscriber(val));
  }

  void subscribeB(Function(B value) subscriber){
    observerB.subscribeObject((val) => subscriber(val));
  }

  void subscribeC(Function(C value) subscriber){
    observerC.subscribeObject((val) => subscriber(val));
  }

  void subscribeD(Function(D value) subscriber){
    observerD.subscribeObject((val) => subscriber(val));
  }

  void subscribeE(Function(E value) subscriber){
    observerE.subscribeObject((val) => subscriber(val));
  }

  void subscribeF(Function(F value) subscriber){
    observerF.subscribeObject((val) => subscriber(val));
  }

  void subscribeResult(Function(G value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}