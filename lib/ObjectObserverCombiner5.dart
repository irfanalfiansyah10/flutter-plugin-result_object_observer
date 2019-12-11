library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ObjectObserver.dart';

class ObjectObserverCombiner5<A, B, C, D, E, F> extends ChangeNotifier{

  ObjectObserver<A, dynamic> _observerA;
  ObjectObserver<B, dynamic> _observerB;
  ObjectObserver<C, dynamic> _observerC;
  ObjectObserver<D, dynamic> _observerD;
  ObjectObserver<E, dynamic> _observerE;

  F _value;
  get value => _value;
  set value(F newValue){
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

  ObjectObserverCombiner5.combine(ObjectObserver<A, dynamic> a,
      ObjectObserver<B, dynamic> b,
      ObjectObserver<C, dynamic> c,
      ObjectObserver<D, dynamic> d,
      ObjectObserver<E, dynamic> e,
      F Function(A, B, C, D, E) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;
    _observerD = d;
    _observerE = e;

    value = map(a.value, b.value, c.value, d.value, e.value);

    a.subscribeObject((v){
      value = map(v, b.value, c.value, d.value, e.value);
    });

    b.subscribeObject((v){
      value = map(a.value, v, c.value, d.value, e.value);
    });

    c.subscribeObject((v){
      value = map(a.value, b.value, v, d.value, e.value);
    });

    d.subscribeObject((v){
      value = map(a.value, b.value, c.value, v, e.value);
    });

    e.subscribeObject((v){
      value = map(a.value, b.value, c.value, d.value, v);
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

  void subscribeResult(Function(F value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}