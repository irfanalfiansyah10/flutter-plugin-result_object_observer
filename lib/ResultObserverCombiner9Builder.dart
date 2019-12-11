library mcnmr_result_object_observer;

import 'package:flutter/widgets.dart';
import 'ResultObserverCombiner9.dart';

class ResultObserverCombiner9Builder<A, B, C, D, E, F, G, H, I, J> extends StatefulWidget {
  final ResultObserverCombiner9<A, B, C, D, E, F, G, H, I, J> observer;
  final bool observeResultAChange;
  final bool observeResultBChange;
  final bool observeResultCChange;
  final bool observeResultDChange;
  final bool observeResultEChange;
  final bool observeResultFChange;
  final bool observeResultGChange;
  final bool observeResultHChange;
  final bool observeResultIChange;
  final bool observeResultChange;
  final Widget Function(A resultA, B resultB, C resultC, D resultD, E resultE, F resultF, G resultG, H resultH, I resultI, J subscriber) builder;

  ResultObserverCombiner9Builder({
    @required this.observer,
    @required this.builder,
    this.observeResultAChange = true,
    this.observeResultBChange = true,
    this.observeResultCChange = true,
    this.observeResultDChange = true,
    this.observeResultEChange = true,
    this.observeResultFChange = true,
    this.observeResultGChange = true,
    this.observeResultHChange = true,
    this.observeResultIChange = true,
    this.observeResultChange = true
  });

  @override
  State<ResultObserverCombiner9Builder<A, B, C, D, E, F, G, H, I, J>> createState() => _ResultObserverCombiner9BuilderState<A, B, C, D, E, F, G, H, I, J>();
}

class _ResultObserverCombiner9BuilderState<A, B, C, D, E, F, G, H, I, J> extends State<ResultObserverCombiner9Builder<A, B, C, D, E, F, G, H, I, J>> {
  A _lastAValue;
  B _lastBValue;
  C _lastCValue;
  D _lastDValue;
  E _lastEValue;
  F _lastFValue;
  G _lastGValue;
  H _lastHValue;
  I _lastIValue;
  J _lastJValue;

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

    if(widget.observeResultHChange){
      widget.observer.subscribeH((value) => setState(() => _lastHValue = value));
    }

    if(widget.observeResultIChange){
      widget.observer.subscribeI((value) => setState(() => _lastIValue = value));
    }

    if(widget.observeResultChange){
      widget.observer.subscribeResult((value) => setState(() => _lastJValue = value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_lastAValue, _lastBValue, _lastCValue, _lastDValue, _lastEValue, _lastFValue, _lastGValue, _lastHValue, _lastIValue, _lastJValue);
  }
}
