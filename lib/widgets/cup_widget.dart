import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'dart:math' as math;

import 'package:wave/wave.dart';

class CupWidget extends StatefulWidget {
  final Color bgColor;
  final Color liquidColor;
  final double liquidHeight;
  final double cupMaxHeight;
  final double waveHeight;
  const CupWidget({
    super.key,
    required this.bgColor,
    required this.liquidColor,
    required this.liquidHeight,
    required this.cupMaxHeight,
    required this.waveHeight,
  });

  @override
  State<CupWidget> createState() => _CupWidgetState();
}

class _CupWidgetState extends State<CupWidget> {
  static const _backgroundColor = Color(0xFFF15BB5);

  static const _colors = [
    Colors.orange,
    Colors.white,
    Colors.lightBlue,
  ];

  static const _durations = [
    5000,
    4000,
    3000,
  ];

  static const _heightPercentages = [
    0.65,
    0.66,
    0.66,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        _buildCup(),
        widget.liquidHeight > 0 ? _buildWave() : Container(),
        _buildGlass(),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.7,
          child: _buildLeftCover(),
        ),
        Positioned(
          left: -MediaQuery.of(context).size.width * 0.7,
          child: _buildRightCover(),
        ),
      ],
    );
  }

  Widget _buildCup() {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: widget.cupMaxHeight - widget.liquidHeight,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: widget.liquidHeight,
          decoration: BoxDecoration(
            color: widget.liquidColor,
          ),
        ),
      ],
    );
  }

  Widget _buildWave() {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _getAboveHeight,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: widget.waveHeight,
          child: WaveWidget(
            duration: 300,
            config: CustomConfig(
              colors: _colors,
              durations: _durations,
              heightPercentages: _heightPercentages,
            ),
            size: const Size(double.infinity, double.infinity),
            waveAmplitude: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildLeftCover() {
    return Transform.rotate(
      angle: math.pi / 15,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: widget.bgColor,
      ),
    );
  }

  Widget _buildRightCover() {
    return Transform.rotate(
      angle: -math.pi / 15,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        color: widget.bgColor,
      ),
    );
  }

  Widget _buildGlass() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.2),
              ],
              begin: AlignmentDirectional.topStart,
              end: AlignmentDirectional.bottomEnd,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: widget.cupMaxHeight,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.2),
            ),
          ),
        ),
      ),
    );
  }

  double get _getAboveHeight {
    if (widget.cupMaxHeight - widget.liquidHeight - widget.waveHeight < 0) {
      return 0;
    }
    return widget.cupMaxHeight - widget.liquidHeight - widget.waveHeight;
  }
}
