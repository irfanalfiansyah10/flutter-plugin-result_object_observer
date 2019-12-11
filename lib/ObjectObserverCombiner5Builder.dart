library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner5.dart';

class ObjectObserverCombiner5Builder<A, B, C, D, E, F> extends StatefulWidget {
  final ObjectObserverCombiner5<A, B, C, D, E, F> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeObjectCChange;
  final bool observeObjectDChange;
  final bool observeObjectEChange;
  final bool observeResultChange;
  final Widget Function(A objectA, B objectB, C objectC, D objectD, E objectE, F result) builder;

  ObjectObserverCombiner5Builder({
    @required this.observer,
    @required this.builder,
    this.observeObjectAChange = true,
    this.observeObjectBChange = true,
    this.observeObjectCChange = true,
    this.observeObjectDChange = true,
    this.observeObjectEChange = true,
    this.observeResultChange = true
  });

  @override
  State<ObjectObserverCombiner5Builder<A, B, C, D, E, F>> createState() =>
      _ObjectObserverCombiner5BuilderState<A, B, C, D, E, F>();
}

class _ObjectObserverCombiner5BuilderState<A, B, C, D, E, F>
    extends State<ObjectObserverCombiner5Builder<A, B, C, D, E, F>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;

  @override
  void initState() {
    super.initState();
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

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastFValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue, _lastDValue, _lastEValue, _lastFValue);
  }
}
