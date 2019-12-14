import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner7.dart';

class ObjectObserverCombiner7Builder<A, B, C, D, E, F, G, H>
    extends StatefulWidget {
  final ObjectObserverCombiner7<A, B, C, D, E, F, G, H> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeObjectCChange;
  final bool observeObjectDChange;
  final bool observeObjectEChange;
  final bool observeObjectFChange;
  final bool observeObjectGChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A objectA, B objectB, C objectC,
      D objectD, E objectE, F objectF, G objectG, H result) builder;

  ObjectObserverCombiner7Builder(
      {@required this.observer,
      @required this.builder,
      this.observeObjectAChange = true,
      this.observeObjectBChange = true,
      this.observeObjectCChange = true,
      this.observeObjectDChange = true,
      this.observeObjectEChange = true,
      this.observeObjectFChange = true,
      this.observeObjectGChange = true,
      this.observeResultChange = true});

  @override
  State<ObjectObserverCombiner7Builder<A, B, C, D, E, F, G, H>> createState() =>
      _ObjectObserverCombiner7BuilderState<A, B, C, D, E, F, G, H>();
}

class _ObjectObserverCombiner7BuilderState<A, B, C, D, E, F, G, H>
    extends State<ObjectObserverCombiner7Builder<A, B, C, D, E, F, G, H>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;
  G _lastGValue;
  H _lastHValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.object;
    _lastBValue = widget.observer.observerB.object;
    _lastCValue = widget.observer.observerC.object;
    _lastDValue = widget.observer.observerD.object;
    _lastEValue = widget.observer.observerE.object;
    _lastFValue = widget.observer.observerF.object;
    _lastGValue = widget.observer.observerG.object;
    _lastHValue = widget.observer.value;

    if (widget.observeObjectAChange) {
      widget.observer
          .subscribeA((value) => setState(() => _lastAValue = value));
    }

    if (widget.observeObjectBChange) {
      widget.observer
          .subscribeB((value) => setState(() => _lastBValue = value));
    }

    if (widget.observeObjectCChange) {
      widget.observer
          .subscribeC((value) => setState(() => _lastCValue = value));
    }

    if (widget.observeObjectDChange) {
      widget.observer
          .subscribeD((value) => setState(() => _lastDValue = value));
    }

    if (widget.observeObjectEChange) {
      widget.observer
          .subscribeE((value) => setState(() => _lastEValue = value));
    }

    if (widget.observeObjectFChange) {
      widget.observer
          .subscribeF((value) => setState(() => _lastFValue = value));
    }

    if (widget.observeObjectGChange) {
      widget.observer
          .subscribeG((value) => setState(() => _lastGValue = value));
    }

    if (widget.observeResultChange) {
      widget.observer
          .subscribeResult((value) => setState(() => _lastHValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lastAValue, _lastBValue, _lastCValue,
        _lastDValue, _lastEValue, _lastFValue, _lastGValue, _lastHValue);
  }
}
