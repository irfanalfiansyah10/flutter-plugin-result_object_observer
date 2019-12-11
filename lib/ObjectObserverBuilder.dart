library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/ObjectObserver.dart';

class ObjectObserverBuilder<A, B> extends StatefulWidget {
  final ObjectObserver<A, B> observer;
  final bool observeObjectChange;
  final bool observeResultChange;
  final Widget Function(A object, B subscriber) builder;

  ObjectObserverBuilder({
    @required this.observer,
    @required this.builder,
    this.observeObjectChange = true,
    this.observeResultChange = true
  });

  @override
  State<ObjectObserverBuilder<A, B>> createState() => _ObjectObserverBuilderState<A, B>();
}

class _ObjectObserverBuilderState<A, B> extends State<ObjectObserverBuilder<A, B>> {
  A _lastAValue;
  B _lastBValue;

  @override
  void initState() {
    super.initState();
    if(widget.observeObjectChange){
      widget.observer.subscribeObject((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastBValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue);
  }
}
