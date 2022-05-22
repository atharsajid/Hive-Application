import 'package:hive/hive.dart';
part 'data.g.dart';

@HiveType(typeId: 0)
class Data extends HiveObject {
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late String image;
}
