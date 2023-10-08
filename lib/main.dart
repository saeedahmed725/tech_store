import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/simple_observer/simple_bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();



}

