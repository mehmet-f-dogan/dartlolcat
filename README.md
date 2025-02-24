# Dart Lolcat

This Dart program colors the output of text in a rainbow pattern, printing each character in a different color, including handling the newlines correctly. It is inspired by the `lolcat`.

The program takes input through stdin (from a pipe or file) and outputs the text with each character colored using a rainbow pattern.

## Features

- **Rainbow-colored output**: Each character gets a different color in the rainbow spectrum.
- **Newline preservation**: Properly handles newlines, ensuring text formatting is maintained.
- **Pipe support**: Works seamlessly with output from other commands (e.g., `fortune`).
- **Terminal-friendly**: Outputs using ANSI escape sequences for color, making it compatible with most terminals that support ANSI colors.

## Requirements

- Dart SDK installed on your machine.

## Setup

1. **Install Dart**:
   If you don’t already have Dart installed, follow the installation guide here: [Install Dart SDK](https://dart.dev/get-dart).

2. **Clone or Download the Repository**:
   Clone the repository or download the Dart script to your local machine.

3. **Run the Program**:
   After setting up Dart, you can run the script using the following command:
   ```bash
   dart run bin/dartlolcat.dart
   ```

## Usage

### With a Pipe (e.g., Using `fortune`):

This is the most common way to use the program. For example, you can pipe the output of the `fortune` command into the Dart program:

```bash
fortune | dart bin/dartlolcat.dart
```

This will generate a random fortune and display it with a rainbow-colored pattern for each character.

### With a File:

You can also pipe content from a file into the program:

```bash
cat your_file.txt | dart bin/dartlolcat.dart
```

This will read the contents of `your_file.txt` and display it with the rainbow effect.

### Output Example:

For example, the following command:

```bash
fortune | dart bin/dartlolcat.dart
```

Would output something like this (with each character in a different color):

```
Here is your fortune:
 __________________
/ I am a good coder! \
|                     |
\_____________________/
```

The characters will be displayed in a rainbow pattern, and the newlines will be preserved.

### Command-line Argument:

Currently, the program does not take any arguments for customization. It processes text from stdin, applies the rainbow effect, and outputs it to stdout.

## Code Breakdown

### 1. **`rgb`**:
   The `rgb(i)` function generates RGB color values for the text based on the index `i`. It uses a sine wave function to create smooth transitions of colors across the spectrum.

### 2. **`stdin.listen`**:
   The program reads from stdin character by character using `stdin.listen`. It handles each character individually, applying the rainbow color and ensuring newlines are preserved correctly.

### 3. **ANSI Escape Sequences**:
   The program uses ANSI escape codes to apply 24-bit RGB color to each character. The escape sequence is formatted as `\x1B[38;2;R;G;Bm` where `R`, `G`, and `B` are the color values.

### 4. **Newline Handling**:
   Whenever a newline is encountered, the program prints it without any color applied and resets the color index for the next line, ensuring the rainbow effect starts fresh for each new line.