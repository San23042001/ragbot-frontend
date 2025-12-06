import 'package:flutter_test/flutter_test.dart';

import 'package:core/core.dart';

void main() {
  test('Log functions execute without errors', () {
    logDebugFinest('TestHeader', 'This is a debug finest message.');
    logDebugFiner('TestHeader', 'This is a debug finer message.');
    logDebugFine('TestHeader', 'This is a debug fine message.');
    logDebug('TestHeader', 'This is a debug message.');
    logInfo('TestHeader', 'This is an info message.');
    logSuccess('TestHeader', 'This is a success message.');
    logWarning('TestHeader', 'This is a warning message.');
    logError('TestHeader', 'This is an error message.');
  });
}
