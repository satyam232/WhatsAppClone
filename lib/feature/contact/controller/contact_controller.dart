import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/contact_repository.dart';

final contactsControllerProvider = FutureProvider(
  (ref) {
    final contactsRepository = ref.watch(contactsRepositoryProvider);
    return contactsRepository.getAllContacts();
  },
);
