import 'package:flutter_test/flutter_test.dart';
import 'package:studydeck_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CardCreationDialogModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
