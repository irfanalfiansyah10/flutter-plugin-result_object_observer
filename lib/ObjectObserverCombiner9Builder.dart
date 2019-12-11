library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner9.dart';

class ObjectObserverCombiner9Builder<A, B, C, D, E, F, G, H, I, J> extends StatefulWidget {
  final ObjectObserverCombiner9<A, B, C, D, E, F, G, H, I, J> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeObjectCChange;
  final bool observeObjectDChange;
  final bool observeObjectEChange;
  final bool observeObjectFChange;
  final bool observeObjectGChange;
  final bool observeObjectHChange;
  final bool observeObjectIChange;
  final bool observeResultChange;
  final Widget Function(A objectA, B objectB, C objectC, D objectD, E objectE, F objectF, G objectG, H objectH, I objectI, J result) builder;

  ObjectObserverCombiner9Builder({
    @required this.observer,
    @required this.builder,
    this.observeObjectAChange = true,
    this.observeObjectBChange = true,
    this.observeObjectCChange = true,
    this.observeObjectDChange = true,
    this.observeObjectEChange = true,
    this.observeObjectFChange = true,
    this.observeObjectGChange = true,
    this.observeObjectHChange = true,
    this.observeObjectIChange = true,
    this.observeResultChange = true
  });

  @override
  State<ObjectObserverCombiner9Builder<A, B, C, D, E, F, G, H, I, J>> createState() =>
      _ObjectObserverCombiner9BuilderState<A, B, C, D, E, F, G, H, I, J>();
}

class _ObjectObserverCombiner9BuilderState<A, B, C, D, E, F, G, H, I, J>
    extends State<ObjectObserverCombiner9Builder<A, B, C, D, E, F, G, H, I, J>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;
  G _lastGValue;
  H _lastHValue;
  I _lastIValue;
  J _lastJValue;

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

    if(widget.observeObjectFChange){
      widget.observer.subscribeF((value) => setState(() => _lastFValue = value));
    }

    if(widget.observeObjectGChange){
      widget.observer.subscribeG((value) => setState(() => _lastGValue = value));
    }

    if(widget.observeObjectHChange){
      widget.observer.subscribeH((value) => setState(() => _lastHValue = value));
    }

    if(widget.observeObjectIChange){
      widget.observer.subscribeI((value) => setState(() => _lastIValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastJValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue, _lastDValue, _lastEValue, _lastFValue, _lastGValue, _lastHValue, _lastIValue, _lastJValue);
  }
}
