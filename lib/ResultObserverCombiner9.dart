import 'package:flutter/widgets.dart';
import 'ObjectObserver.dart';

class ResultObserverCombiner9<A, B, C, D, E, F, G, H, I, J> extends ChangeNotifier{

  ObjectObserver<dynamic, A> observerA;
  ObjectObserver<dynamic, B> observerB;
  ObjectObserver<dynamic, C> observerC;
  ObjectObserver<dynamic, D> observerD;
  ObjectObserver<dynamic, E> observerE;
  ObjectObserver<dynamic, F> observerF;
  ObjectObserver<dynamic, G> observerG;
  ObjectObserver<dynamic, H> observerH;
  ObjectObserver<dynamic, I> observerI;

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

    observerA = a;
    observerB = b;
    observerC = c;
    observerD = d;
    observerE = e;
    observerF = f;
    observerG = g;
    observerH = h;
    observerI = i;

    value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, e.subscriber, f.subscriber, g.subscriber, h.subscriber);

    a.subscribeResult((v){
      value = map(v, b.subscriber, c.subscriber, d.subscriber, e.subscriber, f.subscriber, g.subscriber, h.subscriber);
    });

    b.subscribeResult((v){
      value = map(a.subscriber, v, c.subscriber, d.subscriber, e.subscriber, f.subscriber, g.subscriber, h.subscriber);
    });

    c.subscribeResult((v){
      value = map(a.subscriber, b.subscriber, v, d.subscriber, e.subscriber, f.subscriber, g.subscriber, h.subscriber);
    });

    d.subscribeResult((v){
      value = map(a.subscriber, b.subscriber, c.subscriber, v, e.subscriber, f.subscriber, g.subscriber, h.subscriber);
    });

    e.subscribeResult((v){
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, v, f.subscriber, g.subscriber, h.subscriber);
    });

    f.subscribeResult((v){
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, e.subscriber, v, g.subscriber, h.subscriber);
    });

    g.subscribeResult((v){
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, e.subscriber, f.subscriber, v, h.subscriber);
    });

    h.subscribeResult((v){
      value = map(a.subscriber, b.subscriber, c.subscriber, d.subscriber, e.subscriber, f.subscriber, g.subscriber, v);
    });
  }

  void subscribeA(Function(A value) subscriber){
    observerA.subscribeResult((val) => subscriber(val));
  }

  void subscribeB(Function(B value) subscriber){
    observerB.subscribeResult((val) => subscriber(val));
  }

  void subscribeC(Function(C value) subscriber){
    observerC.subscribeResult((val) => subscriber(val));
  }

  void subscribeD(Function(D value) subscriber){
    observerD.subscribeResult((val) => subscriber(val));
  }

  void subscribeE(Function(E value) subscriber){
    observerE.subscribeResult((val) => subscriber(val));
  }

  void subscribeF(Function(F value) subscriber){
    observerF.subscribeResult((val) => subscriber(val));
  }

  void subscribeG(Function(G value) subscriber){
    observerG.subscribeResult((val) => subscriber(val));
  }

  void subscribeH(Function(H value) subscriber){
    observerH.subscribeResult((val) => subscriber(val));
  }

  void subscribeI(Function(I value) subscriber){
    observerI.subscribeResult((val) => subscriber(val));
  }

  void subscribeResult(Function(J value) subscriber){
    addListener((){
      subscriber(_value);
    });
  }
}