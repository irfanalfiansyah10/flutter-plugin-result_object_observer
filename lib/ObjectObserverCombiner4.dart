library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';

import 'ObjectObserver.dart';

class ObjectObserverCombiner4<A, B, C, D, E> extends ChangeNotifier{

  ObjectObserver<A, dynamic> _observerA;
  ObjectObserver<B, dynamic> _observerB;
  ObjectObserver<C, dynamic> _observerC;
  ObjectObserver<D, dynamic> _observerD;

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

  ObjectObserverCombiner4.combine(ObjectObserver<A, dynamic> a,
      ObjectObserver<B, dynamic> b,
      ObjectObserver<C, dynamic> c,
      ObjectObserver<D, dynamic> d,
      E Function(A, B, C, D) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;
    _observerD = d;

    value = map(a.value, b.value, c.value, d.value);

    a.subscribeObject((v){
      value = map(v, b.value, c.value, d.value);
    });

    b.subscribeObject((v){
      value = map(a.value, v, c.value, d.value);
    });

    c.subscribeObject((v){
      value = map(a.value, b.value, v, d.value);
    });

    d.subscribeObject((v){
      value = map(a.value, b.value, c.value, v);
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

  void subscribeResult(Function(E value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}