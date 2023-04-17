Draws a brace. Useful to group list items together.

## Features

![Sample](https://github.com/stobix/flutter_brace_display/raw/master/readme_resources/sample.png)

## Prerequisites

None, just `flutter pub get brace_display` and you're set.

## Usage

```dart
BraceDisplay(
  header: Text("Items"),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start, // to justify the text close to the brace
    children:[
      Text("Item 1"),
      Text("Item 2"),
      Text("Item 3"),
    ]
  ),
```

