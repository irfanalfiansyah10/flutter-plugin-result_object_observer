import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner3.dart';

class ObjectObserverCombiner3Builder<A, B, C, D> extends StatefulWidget {
  final ObjectObserverCombiner3<A, B, C, D> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeObjectCChange;
  final bool observeResultChange;
  final Widget Function(
      BuildContext context, A objectA, B objectB, C objectC, D result) builder;

  ObjectObserverCombiner3Builder(
      {@required this.observer,
      @required this.builder,
      this.observeObjectAChange = true,
      this.observeObjectBChange = true,
      this.observeObjectCChange = true,
      this.observeResultChange = true});

  @override
  State<ObjectObserverCombiner3Builder<A, B, C, D>> createState() =>
      _ObjectObserverCombiner3BuilderState<A, B, C, D>();
}

class _ObjectObserverCombiner3BuilderState<A, B, C, D>
    extends State<ObjectObserverCombiner3Builder<A, B, C, D>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;

  @override
  void initState() {
    super.initState();

    _lastAValue = widget.observer.observerA.object;
    _lastBValue = widget.observer.observerB.object;
    _lastCValue = widget.observer.observerC.object;
    _lastDValue = widget.observer.value;

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

    if (widget.observeResultChange) {
      widget.observer
          .subscribeResult((value) => setState(() => _lastDValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
        context, _lastAValue, _lastBValue, _lastCValue, _lastDValue);
  }
}
