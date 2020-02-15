import 'package:flutter/material.dart';

class AnimatedCount extends ImplicitlyAnimatedWidget {
  AnimatedCount({
    Key key,
    @required this.count,
    @required Duration duration,
    Curve curve = Curves.linear,
  }) : super(duration: duration, curve: curve, key: key);

  final num count;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatedCountState();
  }
}

class _AnimatedCountState extends AnimatedWidgetBaseState<AnimatedCount> {
  IntTween _intCount;
  Tween<double> _doubleCount;

  @override
  Widget build(BuildContext context) {
    return widget.count is int
        ? Text(_intCount.evaluate(animation).toString())
        : Text(
            _doubleCount.evaluate(animation).toStringAsFixed(2) + ' zł',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1E3932)),
          );
  }

  @override
  void forEachTween(TweenVisitor visitor) {
    if (widget.count is int) {
      _intCount = visitor(
        _intCount,
        widget.count,
        (dynamic value) => IntTween(begin: value),
      );
    } else {
      _doubleCount = visitor(
        _doubleCount,
        widget.count,
        (dynamic value) => Tween<double>(begin: value),
      );
    }
  }
}
