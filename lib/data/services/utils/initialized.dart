import './exceptions.dart';
import 'package:flutter/material.dart';

mixin Initialized<T> {
  bool _didInit = false;

  /// Initializes this instance. It is necessary to call this method before
  /// using this instance in any capacity.
  Future<void> init() async {
    await onInit();
    _didInit = true;
    await afterInit();
  }

  Future<void> onInit();

  Future<void> afterInit() async {}

  @protected
  void assertInit() {
    if (!_didInit) throw InitializationException<T>();
  }

  bool didInit() {
    return _didInit;
  }
}
