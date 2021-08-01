import 'package:hive/hive.dart';
import 'package:smellsense/storage/model/scent-rating.model.dart';

part 'scent-ratings.model.g.dart';

@HiveType(typeId: 1)
class ScentRatings extends HiveObject {
  @HiveField(0)
  List<ScentRating> ratings;

  ScentRatings(this.ratings);

  getTotalScentRating() {
    int totalRating = 0;

    for (ScentRating rating in ratings) {
      totalRating += rating.rating;
    }

    return totalRating;
  }

  @override
  String toString() {
    String string = "";

    for (ScentRating rating in this.ratings) {
      string += rating.toString() + '\n';
    }

    return string;
  }
}
