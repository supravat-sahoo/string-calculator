# String Calculator

A simple implementation of a string calculator that can handle numbers separated by commas or newlines and supports custom delimiters. The calculator can also handle negative numbers and throws appropriate error messages when needed.

## Features

- **Empty String**: Returns `0` when an empty string is passed.
- **Single Number**: Returns the number when a single number is passed.
- **Multiple Numbers**: Returns the sum of numbers when they are separated by commas or newlines.
- **Custom Delimiters**: Supports custom delimiters defined in the format `//<delimiter>\n`.
- **Negative Numbers**: Raises an error when negative numbers are included, with a message listing all negative numbers.
- **Non-String Input**: Raises an error if the input is not a string.

## Installation

Clone this repository to your local machine and navigate to the project directory.

```bash
git clone https://github.com/yourusername/string_calculator.git
cd string_calculator
