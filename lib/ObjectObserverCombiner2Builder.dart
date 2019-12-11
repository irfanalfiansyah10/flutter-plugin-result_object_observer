import 'package:flutter/widgets.dart';
import 'ObjectObserverCombiner2.dart';

class ObjectObserverCombiner2Builder<A, B, C> extends StatefulWidget {
  final ObjectObserverCombiner2<A, B, C> observer;
  final bool observeObjectAChange;
  final bool observeObjectBChange;
  final bool observeResultChange;
  final Widget Function(A objectA, B objectB, C subscriber) builder;

  ObjectObserverCombiner2Builder({
    @required this.observer,
    @required this.builder,
    this.observeObjectAChange = true,
    this.observeObjectBChange = true,
    this.observeResultChange = true
  });

  @override
  State<ObjectObserverCombiner2Builder<A, B, C>> createState() => _ObjectObserverCombiner2BuilderState<A, B, C>();
}

class _ObjectObserverCombiner2BuilderState<A, B, C> extends State<ObjectObserverCombiner2Builder<A, B, C>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;

  @override
  void initState() {
    super.initState();
    if(widget.observeObjectAChange){
      widget.observer.subscribeA((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeObjectBChange){
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
