import 'package:flutter/widgets.dart';
import 'package:mcnmr_result_object_observer/Holder.dart';

class ObjectObserverBuilder<A> extends StatefulWidget {
  final Holder<A, dynamic> observer;
  final Widget Function(BuildContext context, A object) builder;

  ObjectObserverBuilder({
    @required this.observer,
    @required this.builder,
  });

  @override
  State<ObjectObserverBuilder<A>> createState() =>
      _ObjectObserverBuilderState<A>();
}

class _ObjectObserverBuilderState<A> extends State<ObjectObserverBuilder<A>> {
  A _lastAValue;

  @override
  void initState() {
    super.initState();
    _lastAValue = widget.observer.object;

    widget.observer
        .subscribeObject((value) => setState(() => _lastAValue = value));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _lastAValue);
  }
}
