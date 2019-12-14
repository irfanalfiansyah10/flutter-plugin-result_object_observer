import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner4.dart';

class ResultObserverCombiner4Builder<A, B, C, D, E> extends StatefulWidget {
  final ResultObserverCombiner4<A, B, C, D, E> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultDChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A resultA, B resultB, C resultC,
      D resultD, E result) builder;

  ResultObserverCombiner4Builder(
      {@required this.observer,
      @required this.builder,
      this.observeResultAChange = true,
      this.observeResultBChange = true,
      this.observeResultCChange = true,
      this.observeResultDChange = true,
      this.observeResultChange = true});

  @override
  State<ResultObserverCombiner4Builder<A, B, C, D, E>> createState() =>
      _ResultObserverCombiner4BuilderState<A, B, C, D, E>();
}

class _ResultObserverCombiner4BuilderState<A, B, C, D, E>
    extends State<ResultObserverCombiner4Builder<A, B, C, D, E>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.result;
    _lastBValue = widget.observer.observerB.result;
    _lastCValue = widget.observer.observerC.result;
    _lastDValue = widget.observer.observerD.result;
    _lastEValue = widget.observer.value;

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

    if (widget.observeResultChange) {
      widget.observer
          .subscribeResult((value) => setState(() => _lastEValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lastAValue, _lastBValue, _lastCValue,
        _lastDValue, _lastEValue);
  }
}
