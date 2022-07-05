import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

//определить события

class RedColorEvent extends ColorEvent {}

class GreenColorEvent extends ColorEvent {}

// и какие состояния мы хотим ожидать Bloc<Event, State>

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.red) {
    on<RedColorEvent>((event, emit) => emit(Colors.red));
    on<GreenColorEvent>((event, emit) => emit(Colors.green));
  }
}
