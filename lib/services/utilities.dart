import 'package:intl/intl.dart';

class Utilities {
  static NumberFormat formatter = NumberFormat("#,##0.00", "en_US");

  static int getResolution(double value) {
    var resolution = 4;
    if (value <= 100 && value > 1) {
      resolution = 4;
    } else if (value <= 1 && value > 0.01) {
      resolution = 6;
    } else if (value <= 0.01 && value > 0.0001) {
      resolution = 8;
    } else if (value <= 0.0001 && value > 0.0) {
      resolution = 12;
    } else if (value == 0.0) {
      resolution = 1;
    }
    return resolution;
  }

  static format(double value) {
    if (value > 1000) {
      return formatter.format(value);
    } else {
      var resolution = getResolution(value);
      return value.toStringAsFixed(resolution);
    }
  }
}
