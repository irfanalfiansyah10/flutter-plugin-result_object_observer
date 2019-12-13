import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/ObjectObserver.dart';

class ResultObserverBuilder<A> extends StatefulWidget {
  final ObjectObserver<dynamic, A> observer;
  final Widget Function(A subscriber) builder;

  ResultObserverBuilder({
    @required this.observer,
    @required this.builder,
  });

  @override
  State<ResultObserverBuilder<A>> createState() => _ResultObserverBuilderState<A>();
}

class _ResultObserverBuilderState<A> extends State<ResultObserverBuilder<A>> {
  A _lastAValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.subscriber;

    widget.observer.subscribeResult((value) => setState(() => _lastAValue = value));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue);
  }
}
