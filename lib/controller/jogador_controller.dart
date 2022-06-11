import 'dart:async';

import 'package:flutter/cupertino.dart';

class JogadorController extends ChangeNotifier {
  double angle = 0.0;
  double speed = 0.05;
  Timer? _timer;
  bool isVoted = false;

  void rotate() {
    angle = angle >= 2 ? 0 : angle;
    angle += speed;
    notifyListeners();
    if (angle >= 1) stop();
  }

  void start() {
    if (_timer == null) {
      _timer = Timer.periodic(const Duration(milliseconds: 5), (_) => rotate());
    }
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    notifyListeners();
  }

  void reset() {
    angle = 0;
    notifyListeners();
  }

  void stopAndReset() {
    _timer?.cancel();
    _timer = null;
    reset();
  }

  // 0.0 - 0.5 -> nao mostra
  // 0.5 - 1.5 -> mostra
  bool flipCard() {
    isVoted = angle >= 0.5 && angle <= 1.5;
    return isVoted;
  }
}
