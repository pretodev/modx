import 'package:flutter_test/flutter_test.dart';
import 'package:modulex/src/state/rx_async.dart';
import 'package:modulex/src/state/triple_model.dart';

void main() {
  group('RxAsync', () {
    test('should initialize value', () {
      final asyncNumber = RxAsync<Exception, int>(10);
      expect(asyncNumber.status, TripleStatus.done);
      expect(asyncNumber.value, 10);
      expect(asyncNumber.error, null);
    });

    group('Nullable', () {
      test('should initialize value', () {
        final asyncNumber = RxnAsync<Exception, int>(10);
        expect(asyncNumber.status, TripleStatus.done);
        expect(asyncNumber.value, 10);
        expect(asyncNumber.error, null);
      });

      test('should initialize null', () {
        final asyncNumber = RxnAsync<Exception, int>(null);
        expect(asyncNumber.status, TripleStatus.done);
        expect(asyncNumber.value, null);
        expect(asyncNumber.error, null);
      });
    });
  });
}
