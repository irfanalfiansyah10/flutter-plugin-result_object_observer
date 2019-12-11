import 'package:flutter/widgets.dart';
import 'ObjectObserver.dart';

class ResultObserverCombiner9<A, B, C, D, E, F, G, H, I, J> extends ChangeNotifier{

  ObjectObserver<dynamic, A> _observerA;
  ObjectObserver<dynamic, B> _observerB;
  ObjectObserver<dynamic, C> _observerC;
  ObjectObserver<dynamic, D> _observerD;
  ObjectObserver<dynamic, E> _observerE;
  ObjectObserver<dynamic, F> _observerF;
  ObjectObserver<dynamic, G> _observerG;
  ObjectObserver<dynamic, H> _observerH;
  ObjectObserver<dynamic, I> _observerI;

  J _value;
  get value => _value;
  set value(J newValue){
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

  ResultObserverCombiner9.combine(ObjectObserver<dynamic, A> a,
      ObjectObserver<dynamic, B> b,
      ObjectObserver<dynamic, C> c,
      ObjectObserver<dynamic, D> d,
      ObjectObserver<dynamic, E> e,
      ObjectObserver<dynamic, F> f,
      ObjectObserver<dynamic, G> g,
      ObjectObserver<dynamic, H> h,
      ObjectObserver<dynamic, I> i,
      J Function(A, B, C, D, E, F, G, H) map){

    _observerA = a;
    _observerB = b;
    _observerC = c;
    _observerD = d;
    _observerE = e;
    _observerF = f;
    _observerG = g;
    _observerH = h;
    _observerI = i;

    value = map(a.value, b.value, c.value, d.value, e.value, f.value, g.value, h.value);

    a.subscribeResult((v){
      value = map(v, b.value, c.value, d.value, e.value, f.value, g.value, h.value);
    });

    b.subscribeResult((v){
      value = map(a.value, v, c.value, d.value, e.value, f.value, g.value, h.value);
    });

    c.subscribeResult((v){
      value = map(a.value, b.value, v, d.value, e.value, f.value, g.value, h.value);
    });

    d.subscribeResult((v){
      value = map(a.value, b.value, c.value, v, e.value, f.value, g.value, h.value);
    });

    e.subscribeResult((v){
      value = map(a.value, b.value, c.value, d.value, v, f.value, g.value, h.value);
    });

    f.subscribeResult((v){
      value = map(a.value, b.value, c.value, d.value, e.value, v, g.value, h.value);
    });

    g.subscribeResult((v){
      value = map(a.value, b.value, c.value, d.value, e.value, f.value, v, h.value);
    });

    h.subscribeResult((v){
      value = map(a.value, b.value, c.value, d.value, e.value, f.value, g.value, v);
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

  void subscribeF(Function(F value) subscriber){
    _observerF.subscribeResult((val) => subscriber(val));
  }

  void subscribeG(Function(G value) subscriber){
    _observerG.subscribeResult((val) => subscriber(val));
  }

  void subscribeH(Function(H value) subscriber){
    _observerH.subscribeResult((val) => subscriber(val));
  }

  void subscribeI(Function(I value) subscriber){
    _observerI.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(J value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}