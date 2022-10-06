import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_color_models/flutter_color_models.dart';

class CoffeeModel {
  double _milk = 0.0;
  double _water = 0.0;
  double _coffee = 0.0;
  static const double _max = 100.0;
  static const double _unit = 10;

  double get milk => _milk;
  double get water => _water;
  double get coffee => _coffee;

  Color get getColor {
    var coffee = const Color.fromARGB(255, 135, 56, 0);
    var opacity = 0.0;
    var minOpacity = 0.3;

    /// opacity increases as coffee increases
    /// opacity decreases as milk increases
    /// opacity decreases as water increases

    for (var i = 0; i < _coffee; i += 10) {
      opacity += 0.4;
    }

    if (_milk == 0 && _water == 0) {
      return coffee.withOpacity(1);
    }

    for (var i = 0; i < _milk; i += 10) {
      opacity -= 0.03;
    }

    for (var i = 0; i < _water; i += 10) {
      opacity -= 0.03;
    }

    if (opacity < minOpacity) {
      opacity = minOpacity;
    }

    if (opacity > 1) {
      opacity = 1;
    }

    return coffee.withOpacity(opacity);
  }

  double getFilledPercent() {
    return (_milk + _water + _coffee) / _max;
  }

  double get getLevel {
    return _milk + _water + _coffee;
  }

  void addMilk() {
    if (getLevel + _unit <= _max) _milk += _unit;
  }

  void removeMilk() {
    if (getLevel - _unit >= 0 && _milk - _unit >= 0) _milk -= _unit;
  }

  void addWater() {
    if (getLevel + _unit <= _max) _water += _unit;
  }

  void removeWater() {
    if (getLevel - _unit >= 0 && _water - _unit >= 0) _water -= _unit;
  }

  void addCoffee() {
    if (getLevel + _unit <= _max) _coffee += _unit;
  }

  void removeCoffee() {
    if (getLevel - _unit >= 0 && _coffee - _unit >= 0) _coffee -= _unit;
  }
}
