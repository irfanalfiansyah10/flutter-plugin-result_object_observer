library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ObjectObserver.dart';

class ResultObserverCombiner5<A, B, C, D, E, F> extends ChangeNotifier{

  ObjectObserver<dynamic, A> _observerA;
  ObjectObserver<dynamic, B> _observerB;
  ObjectObserver<dynamic, C> _observerC;
  ObjectObserver<dynamic, D> _observerD;
  ObjectObserver<dynamic, E> _observerE;

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

  ResultObserverCombiner5.combine(ObjectObserver<dynamic, A> a,
      ObjectObserver<dynamic, B> b,
      ObjectObserver<dynamic, C> c,
      ObjectObserver<dynamic, D> d,
      ObjectObserver<dynamic, E> e,
      F Function(A, B, C, D, E) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;
    _observerD = d;
    _observerE = e;

    value = map(a.value, b.value, c.value, d.value, e.value);

    a.subscribeResult((v){
      value = map(v, b.value, c.value, d.value, e.value);
    });

    b.subscribeResult((v){
      value = map(a.value, v, c.value, d.value, e.value);
    });

    c.subscribeResult((v){
      value = map(a.value, b.value, v, d.value, e.value);
    });

    d.subscribeResult((v){
      value = map(a.value, b.value, c.value, v, e.value);
    });

    e.subscribeResult((v){
      value = map(a.value, b.value, c.value, d.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    _observerA.subscribeResult((val) => subscriber(val));
  }

  void subscribeB(Function(B value) subscriber){
    _observerB.subscribeResult((val) => subscriber(val));
  }

  void subscribeC(Function(C value) subscriber){
    _observerC.subscribeResult((val) => subscriber(val));
  }

  void subscribeD(Function(D value) subscriber){
    _observerD.subscribeResult((val) => subscriber(val));
  }

  void subscribeE(Function(E value) subscriber){
    _observerE.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(F value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}