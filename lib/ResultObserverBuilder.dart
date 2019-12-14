import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/Holder.dart';

class ResultObserverBuilder<A> extends StatefulWidget {
  final Holder<dynamic, A> observer;
  final Widget Function(A subscriber) builder;

  ResultObserverBuilder({
    @required this.observer,
    @required this.builder,
  });

  @override
  State<ResultObserverBuilder<A>> createState() =>
      _ResultObserverBuilderState<A>();
}

class _ResultObserverBuilderState<A> extends State<ResultObserverBuilder<A>> {
  A _lastAValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.result;

    widget.observer
        .subscribeResult((value) => setState(() => _lastAValue = value));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue);
  }
}
