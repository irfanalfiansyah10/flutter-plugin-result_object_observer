import 'package:flutter/widgets.dart';

import 'ObjectObserver.dart';

class ResultObserverCombiner2<A, B, C> extends ChangeNotifier{

  ObjectObserver<dynamic, A> _observerA;
  ObjectObserver<dynamic, B> _observerB;

  get value => _value;
  C _value;
  set value(C newValue){
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

  ResultObserverCombiner2.combine(ObjectObserver<dynamic, A> a,
      ObjectObserver<dynamic, B> b,
      C Function(A, B) map){

    _observerA = a;
    _observerB = b;
    value = map(a.value, b.value);

    a.subscribeResult((v){
      value = map(v, b.value);
    });

    b.subscribeResult((v){
      value = map(a.value, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    _observerA.subscribeResult((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber){
    _observerB.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(C value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}