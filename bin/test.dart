import 'main.dart';
import 'package:test/test.dart';

void main() {
  test("test case 1", () {
    expect(trackRobot([20, 30, 10, 40]), [-10, 10]);
  });

  test("test case 2", () {
    expect(vendingMachine(500, 9), {
      'product': 'Small snack',
      'change': [100, 100, 100, 100, 20]
    });
  });
}
