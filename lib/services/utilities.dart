import 'package:intl/intl.dart';

class Utilities {
  static NumberFormat formatter = NumberFormat("#,##0.00", "en_US");

  static int getResolution(double value) {
    var resolution = 2;
    var decimals = value.toString().split('.')[1];
    ;
    if (value <= 100 && value > 1) {
      resolution = 2;
    } else if (value < 1 && value > 0.01) {
      resolution = decimals.length > 4 ? 8 : 4;
    } else if (value <= 0.01 && value > 0.0001) {
      resolution = decimals.length > 6 ? 10 : 6;
    } else if (value <= 0.0001 && value > 0.000001) {
      resolution = decimals.length > 8 ? 12 : 8;
    } else if (value <= 0.000001 && value > 0.0) {
      resolution = decimals.length;
    } else if (value == 0.0 || value == 1.0) {
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
