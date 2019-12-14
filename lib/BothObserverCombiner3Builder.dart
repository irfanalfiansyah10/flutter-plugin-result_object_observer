import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/BothObserverCombiner3.dart';

class BothObserverCombiner3Builder<A, B, C, D, E, F, G> extends StatefulWidget {
  final BothObserverCombiner3<A, B, C, D, E, F, G> observer;
  final bool observeObjectAChange;
  final bool observeResultAChange;
  final bool observeObjectBChange;
  final bool observeResultBChange;
  final bool observeObjectCChange;
  final bool observeResultCChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A objectA, B resultA, C objectB,
      D resultB, E objectC, F resultC, G result) builder;

  BothObserverCombiner3Builder(
      {@required this.observer,
      @required this.builder,
      this.observeObjectAChange = true,
      this.observeResultAChange = true,
      this.observeObjectBChange = true,
      this.observeResultBChange = true,
      this.observeObjectCChange = true,
      this.observeResultCChange = true,
      this.observeResultChange = true});

  @override
  State<BothObserverCombiner3Builder<A, B, C, D, E, F, G>> createState() =>
      _BothObserverCombiner3BuilderState<A, B, C, D, E, F, G>();
}

class _BothObserverCombiner3BuilderState<A, B, C, D, E, F, G>
    extends State<BothObserverCombiner3Builder<A, B, C, D, E, F, G>> {
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
    _lastAValue = widget.observer.observerA.object;
    _lastBValue = widget.observer.observerA.result;
    _lastCValue = widget.observer.observerB.object;
    _lastDValue = widget.observer.observerB.result;
    _lastEValue = widget.observer.observerC.object;
    _lastFValue = widget.observer.observerC.result;
    _lastGValue = widget.observer.value;

    if (widget.observeObjectAChange) {
      widget.observer
          .subscribeAObject((value) => setState(() => _lastAValue = value));
    }

    if (widget.observeResultAChange) {
      widget.observer
          .subscribeAResult((value) => setState(() => _lastBValue = value));
    }

    if (widget.observeObjectBChange) {
      widget.observer
          .subscribeBObject((value) => setState(() => _lastCValue = value));
    }

    if (widget.observeResultBChange) {
      widget.observer
          .subscribeBResult((value) => setState(() => _lastDValue = value));
    }

    if (widget.observeObjectCChange) {
      widget.observer
          .subscribeCObject((value) => setState(() => _lastEValue = value));
    }

    if (widget.observeResultCChange) {
      widget.observer
          .subscribeCResult((value) => setState(() => _lastFValue = value));
    }

    if (widget.observeResultChange) {
      widget.observer
          .subscribeResult((value) => setState(() => _lastGValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lastAValue, _lastBValue, _lastCValue,
        _lastDValue, _lastEValue, _lastFValue, _lastGValue);
  }
}
