import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner3.dart';

class ResultObserverCombiner3Builder<A, B, C, D> extends StatefulWidget {
  final ResultObserverCombiner3<A, B, C, D> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultChange;
  final Widget Function(A resultA, B resultB, C resultC, D subscriber) builder;

  ResultObserverCombiner3Builder({
    @required this.observer,
    @required this.builder,
    this.observeResultAChange = true,
    this.observeResultBChange = true,
    this.observeResultCChange = true,
    this.observeResultChange = true
  });

  @override
  State<ResultObserverCombiner3Builder<A, B, C, D>> createState() => _ResultObserverCombiner3BuilderState<A, B, C, D>();
}

class _ResultObserverCombiner3BuilderState<A, B, C, D> extends State<ResultObserverCombiner3Builder<A, B, C, D>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.subscriber;
    _lastBValue = widget.observer.observerB.subscriber;
    _lastCValue = widget.observer.observerC.subscriber;
    _lastDValue = widget.observer.value;

    if(widget.observeResultAChange){
      widget.observer.subscribeA((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeResultBChange){
      widget.observer.subscribeB((value) => setState(() => _lastBValue = value));
    }

    if(widget.observeResultCChange){
      widget.observer.subscribeC((value) => setState(() => _lastCValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastDValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue, _lastDValue);
  }
}
