import 'dart:io';
import 'dart:math';

List<int> rgb(int i) {
  const f = 0.1;
  int r = (sin(f * i + 0) * 127 + 128).round();
  int g = (sin(f * i + 2 * pi / 3) * 127 + 128).round();
  int b = (sin(f * i + 4 * pi / 3) * 127 + 128).round();
  return [r, g, b];
}

void main(List<String> arguments) {
  if (stdin.hasTerminal) {
    print('The command is intended to work with pipes.');
    print('Usage: fortune | gololcat');
    return;
  }

  int j = 0;

  stdin.listen((data) {
    for (var byte in data) {
      var char = String.fromCharCode(byte);

      if (char == '\n') {
        stdout.write(char);
        j = 0;
      } else {
        var rgbValues = rgb(j);
        stdout.write(
            '\x1B[38;2;${rgbValues[0]};${rgbValues[1]};${rgbValues[2]}m$char\x1B[0m');

        j++;
      }
    }
  });
}
