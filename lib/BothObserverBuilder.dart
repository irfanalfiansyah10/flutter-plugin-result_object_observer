import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/Holder.dart';

class BothObserverBuilder<A, B> extends StatefulWidget {
  final Holder<A, B> observer;
  final Widget Function(BuildContext context, A object, B subscriber) builder;

  BothObserverBuilder({
    @required this.observer,
    @required this.builder,
  });

  @override
  State<BothObserverBuilder<A, B>> createState() =>
      _BothObserverBuilderState<A, B>();
}

class _BothObserverBuilderState<A, B> extends State<BothObserverBuilder<A, B>> {
  A _lastAValue;
  B _lastBValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.object;
    _lastBValue = widget.observer.result;

    widget.observer
        .subscribeObject((value) => setState(() => _lastAValue = value));
    widget.observer
        .subscribeResult((value) => setState(() => _lastBValue = value));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lastAValue, _lastBValue);
  }
}
