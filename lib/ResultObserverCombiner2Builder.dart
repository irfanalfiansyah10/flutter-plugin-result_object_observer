import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner2.dart';

class ResultObserverCombiner2Builder<A, B, C> extends StatefulWidget {
  final ResultObserverCombiner2<A, B, C> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultChange;
  final Widget Function(A resultA, B resultB, C subscriber) builder;

  ResultObserverCombiner2Builder({
    @required this.observer,
    @required this.builder,
    this.observeResultAChange = true,
    this.observeResultBChange = true,
    this.observeResultChange = true
  });

  @override
  State<ResultObserverCombiner2Builder<A, B, C>> createState() => _ResultObserverCombiner2BuilderState<A, B, C>();
}

class _ResultObserverCombiner2BuilderState<A, B, C> extends State<ResultObserverCombiner2Builder<A, B, C>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.subscriber;
    _lastBValue = widget.observer.observerB.subscriber;
    _lastCValue = widget.observer.value;

    if(widget.observeResultAChange){
      widget.observer.subscribeA((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeResultBChange){
      widget.observer.subscribeB((value) => setState(() => _lastBValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastCValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue);
  }
}
