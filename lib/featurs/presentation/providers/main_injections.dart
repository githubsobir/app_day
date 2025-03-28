import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final dioProvider = Provider((ref) => Dio());
final hiveBoxProvider = Provider((ref) => Hive.box('standartk'));