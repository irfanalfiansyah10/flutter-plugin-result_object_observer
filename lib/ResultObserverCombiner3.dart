library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';

import 'ObjectObserver.dart';

class ResultObserverCombiner3<A, B, C, D> extends ChangeNotifier{

  ObjectObserver<dynamic, A> _observerA;
  ObjectObserver<dynamic, B> _observerB;
  ObjectObserver<dynamic, C> _observerC;

  get value => _value;
  D _value;
  set value(D newValue){
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

  ResultObserverCombiner3.combine(ObjectObserver<dynamic, A> a,
      ObjectObserver<dynamic, B> b,
      ObjectObserver<dynamic, C> c,
      D Function(A, B, C) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;

    value = map(a.value, b.value, c.value);

    a.subscribeResult((v){
      value = map(v, b.value, c.value);
    });

    b.subscribeResult((v){
      value = map(a.value, v, c.value);
    });

    c.subscribeObject((v){
      value = map(a.value, b.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    _observerA.subscribeResult((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber){
    _observerB.subscribeResult((value) => subscriber(value));
  }

  void subscribeC(Function(C value) subscriber){
    _observerC.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(D value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}