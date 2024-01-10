import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Appwrite Client Provider
final appwriteClientProvider = Provider((ref) {
  Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('659c42dde568ffb0ebc2')
      .setSelfSigned(status: true);
  return client;
});

// Appwirte Account Provider
final appwriteAccountProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

// Appwrite Database Provider 

