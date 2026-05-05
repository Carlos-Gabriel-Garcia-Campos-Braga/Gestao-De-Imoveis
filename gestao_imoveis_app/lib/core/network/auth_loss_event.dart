import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLossEventProvider = NotifierProvider<AuthLossEventNotifier, int>(
  AuthLossEventNotifier.new,
);

class AuthLossEventNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void dispatch() => state++;
}
