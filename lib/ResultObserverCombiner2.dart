import 'package:flutter/widgets.dart';

import 'ObjectObserver.dart';

class ResultObserverCombiner2<A, B, C> extends ChangeNotifier{

  ObjectObserver<dynamic, A> observerA;
  ObjectObserver<dynamic, B> observerB;

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

    observerA = a;
    observerB = b;
    value = map(a.subscriber, b.subscriber);

    a.subscribeResult((v){
      value = map(v, b.subscriber);
    });

    b.subscribeResult((v){
      value = map(a.subscriber, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    observerA.subscribeResult((value) => subscriber(value));
  }

  void subscribeB(Function(B value) subscriber){
    observerB.subscribeResult((value) => subscriber(value));
  }

  void subscribeResult(Function(C value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}