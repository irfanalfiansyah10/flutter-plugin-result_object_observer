import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/BothObserverCombiner7.dart';

class BothObserverCombiner7Builder<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>
    extends StatefulWidget {
  final BothObserverCombiner7<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>
      observer;
  final bool observeObjectAChange;
  final bool observeResultAChange;
  final bool observeObjectBChange;
  final bool observeResultBChange;
  final bool observeObjectCChange;
  final bool observeResultCChange;
  final bool observeObjectDChange;
  final bool observeResultDChange;
  final bool observeObjectEChange;
  final bool observeResultEChange;
  final bool observeObjectFChange;
  final bool observeResultFChange;
  final bool observeObjectGChange;
  final bool observeResultGChange;
  final bool observeResultChange;
  final Widget Function(
      BuildContext context,
      A objectA,
      B resultA,
      C objectB,
      D resultB,
      E objectC,
      F resultC,
      G objectD,
      H resultD,
      I objectE,
      J resultE,
      K objectF,
      L resultF,
      M bojectG,
      N resultG,
      O result) builder;

  BothObserverCombiner7Builder(
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
      this.observeObjectEChange = true,
      this.observeResultEChange = true,
      this.observeObjectFChange = true,
      this.observeResultFChange = true,
      this.observeObjectGChange = true,
      this.observeResultGChange = true,
      this.observeResultChange = true});

  @override
  State<
      BothObserverCombiner7Builder<A, B, C, D, E, F, G, H, I, J, K, L, M, N,
          O>> createState() => _BothObserverCombiner7BuilderState<A, B, C, D, E,
      F, G, H, I, J, K, L, M, N, O>();
}

class _BothObserverCombiner7BuilderState<A, B, C, D, E, F, G, H, I, J, K, L, M,
        N, O>
    extends State<
        BothObserverCombiner7Builder<A, B, C, D, E, F, G, H, I, J, K, L, M, N,
            O>> {
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
  K _lastKValue;
  L _lastLValue;
  M _lastMValue;
  N _lastNValue;
  O _lastOValue;

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
    _lastGValue = widget.observer.observerD.object;
    _lastHValue = widget.observer.observerD.result;
    _lastIValue = widget.observer.observerE.object;
    _lastJValue = widget.observer.observerE.result;
    _lastKValue = widget.observer.observerF.object;
    _lastLValue = widget.observer.observerF.result;
    _lastMValue = widget.observer.observerG.object;
    _lastNValue = widget.observer.observerG.result;
    _lastOValue = widget.observer.value;

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

    if (widget.observeObjectEChange) {
      widget.observer
          .subscribeEObject((value) => setState(() => _lastIValue = value));
    }

    if (widget.observeResultEChange) {
      widget.observer
          .subscribeEResult((value) => setState(() => _lastJValue = value));
    }

    if (widget.observeObjectFChange) {
      widget.observer
          .subscribeFObject((value) => setState(() => _lastKValue = value));
    }

    if (widget.observeResultFChange) {
      widget.observer
          .subscribeFResult((value) => setState(() => _lastLValue = value));
    }

    if (widget.observeObjectGChange) {
      widget.observer
          .subscribeGObject((value) => setState(() => _lastMValue = value));
    }

    if (widget.observeResultGChange) {
      widget.observer
          .subscribeGResult((value) => setState(() => _lastNValue = value));
    }

    if (widget.observeResultChange) {
      widget.observer
          .subscribeResult((value) => setState(() => _lastOValue = value));
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
        _lastIValue,
        _lastJValue,
        _lastKValue,
        _lastLValue,
        _lastMValue,
        _lastNValue,
        _lastOValue);
  }
}
