import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/blocs/theme_bloc/theme_event.dart';
import 'package:library_app/blocs/theme_bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(super.initialState);

  // ignore: non_constant_identifier_names
  Stream<ThemeState> EventToState() async* {}
}
