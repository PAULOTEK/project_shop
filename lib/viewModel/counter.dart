import 'package:flutter/material.dart';
import 'package:shop/viewModel/widgets/counter_state.dart';

class CounterProvider extends InheritedWidget {
  final CounterState state = CounterState();

  CounterProvider({Key? key, required Widget child}) : super(key: key, child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(covariant CounterProvider oldWidget) {
    return oldWidget.state.diff(state);
  }
}
