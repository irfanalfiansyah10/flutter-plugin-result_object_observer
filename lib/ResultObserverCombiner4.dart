import 'package:flutter/widgets.dart';

import 'ObjectObserver.dart';

class ResultObserverCombiner4<A, B, C, D, E> extends ChangeNotifier{

  ObjectObserver<dynamic, A> _observerA;
  ObjectObserver<dynamic, B> _observerB;
  ObjectObserver<dynamic, C> _observerC;
  ObjectObserver<dynamic, D> _observerD;

  E _value;
  get value => _value;
  set value(E newValue){
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

  ResultObserverCombiner4.combine(ObjectObserver<dynamic, A> a,
      ObjectObserver<dynamic, B> b,
      ObjectObserver<dynamic, C> c,
      ObjectObserver<dynamic, D> d,
      E Function(A, B, C, D) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;
    _observerD = d;

    value = map(a.value, b.value, c.value, d.value);

    a.subscribeResult((v){
      value = map(v, b.value, c.value, d.value);
    });

    b.subscribeResult((v){
      value = map(a.value, v, c.value, d.value);
    });

    c.subscribeResult((v){
      value = map(a.value, b.value, v, d.value);
    });

    d.subscribeResult((v){
      value = map(a.value, b.value, c.value, v);
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

  void subscribeResult(Function(E value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}