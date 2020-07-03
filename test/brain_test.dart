import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/models/Brain.dart';

void main() {


  group('Brain', () {
    dynamic brain = Brain();
    test('Initial value should be 0', () {
      expect(brain.value, '0');
    });
  });

  group('Apply commands', () {
    dynamic brain = Brain();

    test('C clears the screen', () {
      brain.applyCommand('C');
      expect(brain.value, '0');

      brain.applyCommand('7');
      brain.applyCommand('+');
      brain.applyCommand('C');
      expect(brain.value, '0');
    });

    test('+/- inverts number sign', () {
      brain.applyCommand('+/-');
      expect(brain.value, '0');

      brain.applyCommand('5');
      brain.applyCommand('+/-');
      expect(brain.value, '-5');

      brain.applyCommand('+/-');
      expect(brain.value, '5');
    });

    test('% ddivdes the number by 100', () {
      brain.applyCommand('C');
      brain.applyCommand('%');
      expect(brain.value, '0');
    });
  });
}