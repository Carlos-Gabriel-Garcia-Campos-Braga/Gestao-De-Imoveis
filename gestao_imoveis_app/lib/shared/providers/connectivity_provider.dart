import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<ConnectivityResult>> connectivity(Ref ref) {
  return Connectivity().onConnectivityChanged;
}

@riverpod
bool isOnline(Ref ref) {
  final results = ref.watch(connectivityProvider).valueOrNull;
  if (results == null) return true;
  return results.any((ConnectivityResult r) => r != ConnectivityResult.none);
}
