import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner4.dart';

class ObjectObserverCombiner4Builder<A, B, C, D, E> extends StatefulWidget {
  final ObjectObserverCombiner4<A, B, C, D, E> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeObjectCChange;
  final bool observeObjectDChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A objectA, B objectB, C objectC,
      D objectD, E result) builder;

  ObjectObserverCombiner4Builder(
      {@required this.observer,
      @required this.builder,
      this.observeObjectAChange = true,
      this.observeObjectBChange = true,
      this.observeObjectCChange = true,
      this.observeObjectDChange = true,
      this.observeResultChange = true});

  @override
  State<ObjectObserverCombiner4Builder<A, B, C, D, E>> createState() =>
      _ObjectObserverCombiner4BuilderState<A, B, C, D, E>();
}

class _ObjectObserverCombiner4BuilderState<A, B, C, D, E>
    extends State<ObjectObserverCombiner4Builder<A, B, C, D, E>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.value;
    _lastBValue = widget.observer.observerB.value;
    _lastCValue = widget.observer.observerC.value;
    _lastDValue = widget.observer.observerD.value;
    _lastEValue = widget.observer.value;

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
