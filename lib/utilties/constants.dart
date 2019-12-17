

import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = Firestore.instance;

final usersRef = firestore.collection('users');
