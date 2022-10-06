import 'package:animated_cup/configs/image_config.dart';
import 'package:animated_cup/model/coffee_model.dart';
import 'package:animated_cup/widgets/cup_widget.dart';
import 'package:flutter/material.dart';

class CupPage extends StatefulWidget {
  const CupPage({super.key});

  @override
  State<CupPage> createState() => _CupPageState();
}

class _CupPageState extends State<CupPage> {
  final CoffeeModel state = CoffeeModel();
  double liquidHeight = 0.0;
  double cupMaxHeight = 300.0;
  double cupHeight = 200.0;
  double addingUnit = 10.0;
  double weveHeight = 20.0;

  static const _backgroundColor = Color(0xFFF15BB5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 70),
                  SizedBox(
                    child: CupWidget(
                      bgColor: const Color.fromARGB(255, 0, 0, 0),
                      liquidColor: state.getColor,
                      cupMaxHeight: cupMaxHeight,
                      liquidHeight: cupMaxHeight * state.getFilledPercent(),
                      waveHeight: weveHeight,
                    ),
                  ),
                ],
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.5 -
                    (MediaQuery.of(context).size.width * 0.6) / 2,
                child: Image.asset(
                  ImageConfig.cupLid,
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 100,
                ),
              ),
            ],
          ),
          _buildItem(
            "Coffee",
            state.coffee,
            state.addCoffee,
            state.removeCoffee,
          ),
          _buildItem(
            "Water",
            state.water,
            state.addWater,
            state.removeWater,
          ),
          _buildItem(
            "Milk",
            state.milk,
            state.addMilk,
            state.removeMilk,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String text, double value, Function add, Function remove) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              remove();
            });
          },
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Text('$text: $value', style: const TextStyle(color: Colors.white)),
        IconButton(
          onPressed: () {
            setState(() {
              add();
            });
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
