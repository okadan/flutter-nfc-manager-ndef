import 'package:flutter/foundation.dart';
import 'package:ndef_record/ndef_record.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/nfc_manager_ios.dart';
import 'package:nfc_manager_ndef/src/ndef.dart';

@visibleForTesting
final class NdefPlatformIOS implements Ndef {
  const NdefPlatformIOS._(this._tech);

  final NdefIOS _tech;

  static NdefPlatformIOS? from(NfcTag tag) {
    final tech = NdefIOS.from(tag);
    return tech == null ? null : NdefPlatformIOS._(tech);
  }

  @override
  bool get isWritable => _tech.status == NdefStatusIOS.readWrite;

  @override
  int get maxSize => _tech.capacity;

  @override
  NdefMessage? get cachedMessage => _tech.cachedNdefMessage;

  @override
  Map<String, dynamic> get additionalData => {};

  @override
  Future<NdefMessage?> read() {
    return _tech.readNdef();
  }

  @override
  Future<void> write({required NdefMessage message}) {
    return _tech.writeNdef(message);
  }

  @override
  Future<void> writeLock() {
    return _tech.writeLock();
  }
}
