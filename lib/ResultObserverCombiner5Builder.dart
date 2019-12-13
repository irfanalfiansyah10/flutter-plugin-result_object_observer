import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner5.dart';

class ResultObserverCombiner5Builder<A, B, C, D, E, F> extends StatefulWidget {
  final ResultObserverCombiner5<A, B, C, D, E, F> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultDChange;
  final bool observeResultEChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A resultA, B resultB, C resultC, D resultD, E resultE, F subscriber) builder;

  ResultObserverCombiner5Builder({
    @required this.observer,
    @required this.builder,
    this.observeResultAChange = true,
    this.observeResultBChange = true,
    this.observeResultCChange = true,
    this.observeResultDChange = true,
    this.observeResultEChange = true,
    this.observeResultChange = true
  });

  @override
  State<ResultObserverCombiner5Builder<A, B, C, D, E, F>> createState() => _ResultObserverCombiner5BuilderState<A, B, C, D, E, F>();
}

class _ResultObserverCombiner5BuilderState<A, B, C, D, E, F> extends State<ResultObserverCombiner5Builder<A, B, C, D, E, F>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.subscriber;
    _lastBValue = widget.observer.observerB.subscriber;
    _lastCValue = widget.observer.observerC.subscriber;
    _lastDValue = widget.observer.observerD.subscriber;
    _lastEValue = widget.observer.observerE.subscriber;
    _lastFValue = widget.observer.value;

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

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastFValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lastAValue, _lastBValue, _lastCValue, _lastDValue, _lastEValue, _lastFValue);
  }
}
