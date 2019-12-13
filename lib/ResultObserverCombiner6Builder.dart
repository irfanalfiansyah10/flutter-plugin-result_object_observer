import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner6.dart';

class ResultObserverCombiner6Builder<A, B, C, D, E, F, G> extends StatefulWidget {
  final ResultObserverCombiner6<A, B, C, D, E, F, G> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultDChange;
  final bool observeResultEChange;
  final bool observeResultFChange;
  final bool observeResultChange;
  final Widget Function(A resultA, B resultB, C resultC, D resultD, E resultE, F resultF, G subscriber) builder;

  ResultObserverCombiner6Builder({
    @required this.observer,
    @required this.builder,
    this.observeResultAChange = true,
    this.observeResultBChange = true,
    this.observeResultCChange = true,
    this.observeResultDChange = true,
    this.observeResultEChange = true,
    this.observeResultFChange = true,
    this.observeResultChange = true
  });

  @override
  State<ResultObserverCombiner6Builder<A, B, C, D, E, F, G>> createState() => _ResultObserverCombiner6BuilderState<A, B, C, D, E, F, G>();
}

class _ResultObserverCombiner6BuilderState<A, B, C, D, E, F, G> extends State<ResultObserverCombiner6Builder<A, B, C, D, E, F, G>> {
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
    _lastAValue = widget.observer.observerA.subscriber;
    _lastBValue = widget.observer.observerB.subscriber;
    _lastCValue = widget.observer.observerC.subscriber;
    _lastDValue = widget.observer.observerD.subscriber;
    _lastEValue = widget.observer.observerE.subscriber;
    _lastFValue = widget.observer.observerF.subscriber;
    _lastGValue = widget.observer.value;

    if(widget.observeResultAChange){
      widget.observer.subscribeA((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeResultBChange){
      widget.observer.subscribeB((value) => setState(() => _lastBValue = value));
    }

    if(widget.observeResultCChange){
      widget.observer.subscribeC((value) => setState(() => _lastCValue = value));
    }

    if(widget.observeResultDChange){
      widget.observer.subscribeD((value) => setState(() => _lastDValue = value));
    }

    if(widget.observeResultEChange){
      widget.observer.subscribeE((value) => setState(() => _lastEValue = value));
    }

    if(widget.observeResultFChange){
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
