import 'package:flutter/material.dart';

class CoffeeModel {
  double _milk = 0.0;
  double _water = 0.0;
  double _coffee = 0.0;
  static const double _max = 100.0;
  static const double _unit = 10;

  double get milk => _milk;
  double get water => _water;
  double get coffee => _coffee;

  Color get getColor => Colors.brown;

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
