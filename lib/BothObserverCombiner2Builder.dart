import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/BothObserverCombiner2.dart';

class BothObserverCombiner2Builder<A, B, C, D, E> extends StatefulWidget {
  final BothObserverCombiner2<A, B, C, D, E> observer;
  final bool observeObjectAChange;
  final bool observeResultAChange;
  final bool observeObjectBChange;
  final bool observeResultBChange;
  final bool observeResultChange;
  final Widget Function(BuildContext context, A objectA, B resultA, C objectB,
      D resultB, E result) builder;

  BothObserverCombiner2Builder(
      {@required this.observer,
      @required this.builder,
      this.observeObjectAChange = true,
      this.observeResultAChange = true,
      this.observeObjectBChange = true,
      this.observeResultBChange = true,
      this.observeResultChange = true});

  @override
  State<BothObserverCombiner2Builder<A, B, C, D, E>> createState() =>
      _BothObserverCombiner2BuilderState<A, B, C, D, E>();
}

class _BothObserverCombiner2BuilderState<A, B, C, D, E>
    extends State<BothObserverCombiner2Builder<A, B, C, D, E>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.observerA.object;
    _lastBValue = widget.observer.observerA.result;
    _lastCValue = widget.observer.observerB.object;
    _lastDValue = widget.observer.observerB.result;
    _lastEValue = widget.observer.value;

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
