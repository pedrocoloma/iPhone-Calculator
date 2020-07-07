import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/models/Brain.dart';

void main() {
  dynamic brain = Brain();

  group('Brain', () {
    test('Initial value should be 0', () {
      expect(brain.value, '0');
    });
  });

  group('Apply commands', () {
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
  });

  group('Division by 100 (%)', () {
    test('divides zero', () {
      brain.applyCommand('C');
      brain.applyCommand('%');

      expect(brain.value, '0');
    });

    test('divides integers', () {
      brain.applyCommand('C');
      brain.applyCommand('3');
      brain.applyCommand('%');

      expect(brain.value, '0.03');

      brain.applyCommand('C');
      brain.applyCommand('-3');
      brain.applyCommand('%');

      expect(brain.value, '-0.03');
    });

    test('divides decimals', () {
      brain.applyCommand('C');
      brain.applyCommand('0.5');
      brain.applyCommand('%');

      expect(brain.value, '0.005');

      brain.applyCommand('C');
      brain.applyCommand('2');
      brain.applyCommand('%');
      brain.applyCommand('%');

      expect(brain.value, '0.0002');
    });
  });

  group('Test division', () {
    test('Regular division', () {
      brain.applyCommand('C');
      brain.applyCommand('7');
      brain.applyCommand('/');
      brain.applyCommand('2');
      brain.applyCommand('=');

      expect(brain.value, '3.5');
    });

    test('Division by zero', () {
      brain.applyCommand('C');
      brain.applyCommand('5');
      brain.applyCommand('/');
      brain.applyCommand('0');
      brain.applyCommand('=');

      expect(brain.value, 'Infinity');

      brain.applyCommand('C');
      brain.applyCommand('0.5');
      brain.applyCommand('/');
      brain.applyCommand('0');
      brain.applyCommand('=');

      expect(brain.value, 'Infinity');
    });

    test('Dividing negative numbers', () {
      brain.applyCommand('C');
      brain.applyCommand('5');
      brain.applyCommand('+/-');
      brain.applyCommand('/');
      brain.applyCommand('2');
      brain.applyCommand('=');

      expect(brain.value, '-2.5');
    });

    test('Dividings decimal numbers', () {
      brain.applyCommand('C');
      brain.applyCommand('0');
      brain.applyCommand('.');
      brain.applyCommand('8');
      brain.applyCommand('/');
      brain.applyCommand('2');
      brain.applyCommand('=');

      expect(brain.value, '0.4');
    });

    test('Dividing by decimal numbers', () {
      brain.applyCommand('C');
      brain.applyCommand('8');
      brain.applyCommand('/');
      brain.applyCommand('0.5');
      brain.applyCommand('=');

      expect(brain.value, '16');
    });
  });
  
  group('Test multiplication', () {
    test('Regular multiplication', () {
      brain.applyCommand('C');
      brain.applyCommand('7');
      brain.applyCommand('x');
      brain.applyCommand('2');
      brain.applyCommand('=');

      expect(brain.value, '14');
    });

    test('Multiplying by zero', () {
      brain.applyCommand('C');
      brain.applyCommand('7');
      brain.applyCommand('x');
      brain.applyCommand('0');
      brain.applyCommand('=');

      expect(brain.value, '0');
    });

    test('Multiplying negative numbers', () {
      brain.applyCommand('C');
      brain.applyCommand('7');
      brain.applyCommand('+/-');
      brain.applyCommand('x');
      brain.applyCommand('2');
      brain.applyCommand('=');

      expect(brain.value, '-14');
    });

    test('Multiplying decimal numbers', () {
      brain.applyCommand('C');
      brain.applyCommand('0.2');
      brain.applyCommand('x');
      brain.applyCommand('2');
      brain.applyCommand('=');

      expect(brain.value, '0.4');

      brain.applyCommand('C');
      brain.applyCommand('0.4');
      brain.applyCommand('x');
      brain.applyCommand('0.5');
      brain.applyCommand('=');

      expect(brain.value, '0.2');

      brain.applyCommand('C');
      brain.applyCommand('5');
      brain.applyCommand('x');
      brain.applyCommand('0.2');
      brain.applyCommand('=');

      expect(brain.value, '1');
    });
  });

  group('Test subtraction', () {
    test('Regular subtraction', () {
      brain.applyCommand('C');
      brain.applyCommand('4');
      brain.applyCommand('-');
      brain.applyCommand('0');
      brain.applyCommand('=');

      expect(brain.value, '4');

      brain.applyCommand('C');
      brain.applyCommand('4');
      brain.applyCommand('-');
      brain.applyCommand('1');
      brain.applyCommand('=');

      expect(brain.value, '3');

      brain.applyCommand('C');
      brain.applyCommand('4');
      brain.applyCommand('-');
      brain.applyCommand('0.5');
      brain.applyCommand('=');

      expect(brain.value, '3.5');

      brain.applyCommand('C');
      brain.applyCommand('4');
      brain.applyCommand('-');
      brain.applyCommand('0');
      brain.applyCommand('=');

      expect(brain.value, '4');
    });

    test('Subtracting zero', () {
      brain.applyCommand('C');
      brain.applyCommand('4');
      brain.applyCommand('-');
      brain.applyCommand('0');
      brain.applyCommand('=');

      expect(brain.value, '4');
    });

    test('Subtracting negative numbers', () {
      brain.applyCommand('C');
      brain.applyCommand('3');
      brain.applyCommand('+/-');
      brain.applyCommand('-');
      brain.applyCommand('4');
      brain.applyCommand('=');

      expect(brain.value, '-7');

      brain.applyCommand('C');
      brain.applyCommand('1.5');
      brain.applyCommand('+/-');
      brain.applyCommand('-');
      brain.applyCommand('4');
      brain.applyCommand('=');

      expect(brain.value, '-5.5');
    });
  });
    group('Test equals command', () {
    test('Equals whdoes not affect current number', () {
      brain.applyCommand('C');
      brain.applyCommand('5');
      brain.applyCommand('=');

      expect(brain.value, '5');

      brain.applyCommand('+/-');
      brain.applyCommand('=');

      expect(brain.value, '-5');
    });

    test('Equals when infinity is displayed', () {
      brain.applyCommand('C');
      brain.applyCommand('5');
      brain.applyCommand('/');
      brain.applyCommand('0');
      brain.applyCommand('=');
      brain.applyCommand('=');

      expect(brain.value, 'Infinity');
    });
  });
}