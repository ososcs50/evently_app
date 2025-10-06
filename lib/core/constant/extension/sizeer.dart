import 'package:flutter/widgets.dart';

extension Sizeer on num {
  get h => SizedBox(height: this.toDouble());
  get w => SizedBox(width: this.toDouble());
}
