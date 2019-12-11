library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner7.dart';

class ResultObserverCombiner7Builder<A, B, C, D, E, F, G, H> extends StatefulWidget {
  final ResultObserverCombiner7<A, B, C, D, E, F, G, H> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultDChange;
  final bool observeResultEChange;
  final bool observeResultFChange;
  final bool observeResultGChange;
  final bool observeResultChange;
  final Widget Function(A resultA, B resultB, C resultC, D resultD, E resultE, F resultF, G resultG, H subscriber) builder;

  ResultObserverCombiner7Builder({
    @required this.observer,
    @required this.builder,
    this.observeResultAChange = true,
    this.observeResultBChange = true,
    this.observeResultCChange = true,
    this.observeResultDChange = true,
    this.observeResultEChange = true,
    this.observeResultFChange = true,
    this.observeResultGChange = true,
    this.observeResultChange = true
  });

  @override
  State<ResultObserverCombiner7Builder<A, B, C, D, E, F, G, H>> createState() => _ResultObserverCombiner7BuilderState<A, B, C, D, E, F, G, H>();
}

class _ResultObserverCombiner7BuilderState<A, B, C, D, E, F, G, H> extends State<ResultObserverCombiner7Builder<A, B, C, D, E, F, G, H>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;
  G _lastGValue;
  H _lastHValue;

  @override
  void initState() {
    super.initState();
    if(widget.observeResultAChange){
      widget.observer.subscribeA((value) => setState(() => _lastAValue = value));
    }

    if(widget.observeResultBChange){
      widget.observer.subscribeB((value) => setState(() => _lastBValue = value));
    }

    if(widget.observeResultCChange){
      widget.observer.subscribeC((value) => setState(() => _lastCValue = value));
    }

    if(widget.observeResultDChange){
      widget.observer.subscribeD((value) => setState(() => _lastDValue = value));
    }

    if(widget.observeResultEChange){
      widget.observer.subscribeE((value) => setState(() => _lastEValue = value));
    }

    if(widget.observeResultFChange){
      widget.observer.subscribeF((value) => setState(() => _lastFValue = value));
    }

    if(widget.observeResultGChange){
      widget.observer.subscribeG((value) => setState(() => _lastGValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastHValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue, _lastDValue, _lastEValue, _lastFValue, _lastGValue, _lastHValue);
  }
}
