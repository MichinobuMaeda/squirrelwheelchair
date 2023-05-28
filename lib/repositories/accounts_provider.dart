import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/account.dart';
import 'firebase_provider.dart';
import 'auth_state_provider.dart';

part 'accounts_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<List<Account>> accounts(AccountsRef ref) {
  final firebase = ref.watch(firebaseProvider);
  final state = ref.watch(authStateProvider).value;
  if (state?.account == null) {
    return const Stream<List<Account>>.empty();
  }
  final List<Account> current = ref.state.value ?? [];
  final collectionRef = firebase.db.collection('accounts');

  return state!.account!.admin
      ? collectionRef.snapshots().map(
          (snapshot) {
            var modified = current.toList();

            for (var change in snapshot.docChanges) {
              modified = modified
                  .where((account) => account.id != change.doc.id)
                  .toList();
            }

            bool changed = current.length != modified.length;

            for (var change in snapshot.docChanges) {
              if (change.type == DocumentChangeType.removed) continue;
              changed = true;
              modified.add(Account.fromDoc(change.doc)!);
            }

            return changed ? modified : current;
          },
        )
      : collectionRef.doc(state.account!.id).snapshots().map(
          (doc) {
            if (doc.exists) {
              final account = Account.fromDoc(doc)!;
              return (current.length == 1 && account == current[0])
                  ? current
                  : [account];
            } else {
              return current.isEmpty ? current : [];
            }
          },
        );
}
