import 'package:hive/hive.dart';
import 'package:hive_application/Model%20Class%20Hive/data.dart';

class Boxes {
  static Box<Data> getData() => Hive.box<Data>('data');
}
