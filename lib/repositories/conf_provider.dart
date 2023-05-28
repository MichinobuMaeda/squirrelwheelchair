import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/conf.dart';
import 'firebase_provider.dart';

part 'conf_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<Conf> conf(ConfRef ref) => ref
    .watch(firebaseProvider)
    .db
    .collection('service')
    .doc('conf')
    .snapshots()
    .map((doc) => Conf.fromDoc(doc)!);
