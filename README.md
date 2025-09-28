# nfc_manager_ndef

A Flutter package providing an NDEF abstraction built on top of [`nfc_manager`](https://pub.dev/packages/nfc_manager).

## Setup

See the `nfc_manager` plugin's [Setup](https://pub.dev/packages/nfc_manager#setup) section.

## Usage

```dart
import 'package:nfc_manager_ndef/nfc_manager_ndef.dart';

final Ndef ndef = Ndef.from(tag);

if (ndef == null) {
  print('This tag is not compatible with NDEF.');
  return;
}

// Do something with an Ndef instance ...
print(ndef);
```
