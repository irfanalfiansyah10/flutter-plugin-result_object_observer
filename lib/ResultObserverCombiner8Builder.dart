import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner8.dart';

class ResultObserverCombiner8Builder<A, B, C, D, E, F, G, H, I>
    extends StatefulWidget {
  final ResultObserverCombiner8<A, B, C, D, E, F, G, H, I> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultDChange;
  final bool observeResultEChange;
  final bool observeResultFChange;
  final bool observeResultGChange;
  final bool observeResultHChange;
  final bool observeResultChange;
  final Widget Function(
      BuildContext context,
      A resultA,
      B resultB,
      C resultC,
      D resultD,
      E resultE,
      F resultF,
      G resultG,
      H resultH,
      I subscriber) builder;

  ResultObserverCombiner8Builder(
      {@required this.observer,
      @required this.builder,
      this.observeResultAChange = true,
      this.observeResultBChange = true,
      this.observeResultCChange = true,
      this.observeResultDChange = true,
      this.observeResultEChange = true,
      this.observeResultFChange = true,
      this.observeResultGChange = true,
      this.observeResultHChange = true,
      this.observeResultChange = true});

  @override
  State<ResultObserverCombiner8Builder<A, B, C, D, E, F, G, H, I>>
      createState() =>
          _ResultObserverCombiner8BuilderState<A, B, C, D, E, F, G, H, I>();
}

class _ResultObserverCombiner8BuilderState<A, B, C, D, E, F, G, H, I>
    extends State<ResultObserverCombiner8Builder<A, B, C, D, E, F, G, H, I>> {
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
    _lastAValue = widget.observer.observerA.subscriber;
    _lastBValue = widget.observer.observerB.subscriber;
    _lastCValue = widget.observer.observerC.subscriber;
    _lastDValue = widget.observer.observerD.subscriber;
    _lastEValue = widget.observer.observerE.subscriber;
    _lastFValue = widget.observer.observerF.subscriber;
    _lastGValue = widget.observer.observerG.subscriber;
    _lastHValue = widget.observer.observerH.subscriber;
    _lastIValue = widget.observer.value;

    if (widget.observeResultAChange) {
      widget.observer
          .subscribeA((value) => setState(() => _lastAValue = value));
    }

    if (widget.observeResultBChange) {
      widget.observer
          .subscribeB((value) => setState(() => _lastBValue = value));
    }

    if (widget.observeResultCChange) {
      widget.observer
          .subscribeC((value) => setState(() => _lastCValue = value));
    }

    if (widget.observeResultDChange) {
      widget.observer
          .subscribeD((value) => setState(() => _lastDValue = value));
    }

    if (widget.observeResultEChange) {
      widget.observer
          .subscribeE((value) => setState(() => _lastEValue = value));
    }

    if (widget.observeResultFChange) {
      widget.observer
          .subscribeF((value) => setState(() => _lastFValue = value));
    }

    if (widget.observeResultGChange) {
      widget.observer
          .subscribeG((value) => setState(() => _lastGValue = value));
    }

    if (widget.observeResultHChange) {
      widget.observer
          .subscribeH((value) => setState(() => _lastHValue = value));
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
