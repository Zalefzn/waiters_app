import 'package:flutter/material.dart';
import 'dart:async';

enum ColorEvent { to_light_blue }

class ColorBloc {
  Color _color = Colors.blue;

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_light_blue) {
      _color = Colors.blue;
    } else {
      _color = Colors.grey.shade300;

      _stateSink.add(_color);
    }

    ColorBloc() {
      _eventController.stream.listen(_mapEventToState);
    }

    void dispose() {
      _eventController.close();
      _stateController.close();
    }
  }
}
