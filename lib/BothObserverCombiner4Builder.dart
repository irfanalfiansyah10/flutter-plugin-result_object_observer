import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/BothObserverCombiner4.dart';

class BothObserverCombiner4Builder<A, B, C, D, E, F, G, H, I>
    extends StatefulWidget {
  final BothObserverCombiner4<A, B, C, D, E, F, G, H, I> observer;
  final bool observeObjectAChange;
  final bool observeResultAChange;
  final bool observeObjectBChange;
  final bool observeResultBChange;
  final bool observeObjectCChange;
  final bool observeResultCChange;
  final bool observeObjectDChange;
  final bool observeResultDChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A objectA, B resultA, C objectB,
      D resultB, E objectC, F resultC, G objectD, H resultD, I result) builder;

  BothObserverCombiner4Builder(
      {@required this.observer,
      @required this.builder,
      this.observeObjectAChange = true,
      this.observeResultAChange = true,
      this.observeObjectBChange = true,
      this.observeResultBChange = true,
      this.observeObjectCChange = true,
      this.observeResultCChange = true,
      this.observeObjectDChange = true,
      this.observeResultDChange = true,
      this.observeResultChange = true});

  @override
  State<BothObserverCombiner4Builder<A, B, C, D, E, F, G, H, I>>
      createState() =>
          _BothObserverCombiner4BuilderState<A, B, C, D, E, F, G, H, I>();
}

class _BothObserverCombiner4BuilderState<A, B, C, D, E, F, G, H, I>
    extends State<BothObserverCombiner4Builder<A, B, C, D, E, F, G, H, I>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;
  G _lastGValue;
  H _lastHValue;
  I _lastIValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.object;
    _lastBValue = widget.observer.observerA.result;
    _lastCValue = widget.observer.observerB.object;
    _lastDValue = widget.observer.observerB.result;
    _lastEValue = widget.observer.observerC.object;
    _lastFValue = widget.observer.observerC.result;
    _lastGValue = widget.observer.observerD.object;
    _lastHValue = widget.observer.observerD.result;
    _lastIValue = widget.observer.value;

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

    if (widget.observeObjectDChange) {
      widget.observer
          .subscribeDObject((value) => setState(() => _lastGValue = value));
    }

    if (widget.observeResultDChange) {
      widget.observer
          .subscribeDResult((value) => setState(() => _lastHValue = value));
    }

    if (widget.observeResultChange) {
      widget.observer
          .subscribeResult((value) => setState(() => _lastIValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context,
        _lastAValue,
        _lastBValue,
        _lastCValue,
        _lastDValue,
        _lastEValue,
        _lastFValue,
        _lastGValue,
        _lastHValue,
        _lastIValue);
  }
}
