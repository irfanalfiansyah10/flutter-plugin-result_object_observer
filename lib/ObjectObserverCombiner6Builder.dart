import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner6.dart';

class ObjectObserverCombiner6Builder<A, B, C, D, E, F, G> extends StatefulWidget {
  final ObjectObserverCombiner6<A, B, C, D, E, F, G> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeObjectCChange;
  final bool observeObjectDChange;
  final bool observeObjectEChange;
  final bool observeObjectFChange;
  final bool observeResultChange;
  final Widget Function(A objectA, B objectB, C objectC, D objectD, E objectE, F objectF, G result) builder;

  ObjectObserverCombiner6Builder({
    @required this.observer,
    @required this.builder,
    this.observeObjectAChange = true,
    this.observeObjectBChange = true,
    this.observeObjectCChange = true,
    this.observeObjectDChange = true,
    this.observeObjectEChange = true,
    this.observeObjectFChange = true,
    this.observeResultChange = true
  });

  @override
  State<ObjectObserverCombiner6Builder<A, B, C, D, E, F, G>> createState() =>
      _ObjectObserverCombiner6BuilderState<A, B, C, D, E, F, G>();
}

class _ObjectObserverCombiner6BuilderState<A, B, C, D, E, F, G>
    extends State<ObjectObserverCombiner6Builder<A, B, C, D, E, F, G>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;
  G _lastGValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.value;
    _lastBValue = widget.observer.observerB.value;
    _lastCValue = widget.observer.observerC.value;
    _lastDValue = widget.observer.observerD.value;
    _lastEValue = widget.observer.observerE.value;
    _lastFValue = widget.observer.observerF.value;
    _lastGValue = widget.observer.value;

    if(widget.observeObjectAChange){
      widget.observer.subscribeA((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeObjectBChange){
      widget.observer.subscribeB((value) => setState(() => _lastBValue = value));
    }

    if(widget.observeObjectCChange){
      widget.observer.subscribeC((value) => setState(() => _lastCValue = value));
    }

    if(widget.observeObjectDChange){
      widget.observer.subscribeD((value) => setState(() => _lastDValue = value));
    }

    if(widget.observeObjectEChange){
      widget.observer.subscribeE((value) => setState(() => _lastEValue = value));
    }

    if(widget.observeObjectFChange){
      widget.observer.subscribeF((value) => setState(() => _lastFValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastGValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue, _lastDValue, _lastEValue, _lastFValue, _lastGValue);
  }
}
