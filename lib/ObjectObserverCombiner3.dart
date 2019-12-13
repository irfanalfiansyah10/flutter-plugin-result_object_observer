import 'package:flutter/widgets.dart';

import 'ObjectObserver.dart';

class ObjectObserverCombiner3<A, B, C, D> extends ChangeNotifier{

  ObjectObserver<A, dynamic> observerA;
  ObjectObserver<B, dynamic> observerB;
  ObjectObserver<C, dynamic> observerC;

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

  ObjectObserverCombiner3.combine(ObjectObserver<A, dynamic> a,
      ObjectObserver<B, dynamic> b,
      ObjectObserver<C, dynamic> c,
      D Function(A, B, C) map){

    observerA = a;
    observerB = b;
    observerC = c;
    value = map(a.value, b.value, c.value);

    a.subscribeObject((v){
      value = map(v, b.value, c.value);
    });

    b.subscribeObject((v){
      value = map(a.value, v, c.value);
    });

    c.subscribeObject((v){
      value = map(a.value, b.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    observerA.subscribeObject((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber){
    observerB.subscribeObject((value) => subscriber(value));
  }

  void subscribeC(Function(C value) subscriber){
    observerC.subscribeObject((value) => subscriber(value));
  }

  void subscribeResult(Function(D value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}