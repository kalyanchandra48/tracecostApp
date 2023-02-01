import 'package:tracecost_app/models/media.dart';
import 'package:tracecost_app/services/hive.dart';

class HiveStorage {
  static saveMediaData(Media media) async {
    await Global.boxes[BOXNAME.mediadata]?.put(media.mid, media);
  }

  static deleteMediaData(Media media) async {
    Media mediaa = await Global.boxes[BOXNAME.mediadata]?.get(media.mid);
    await Global.boxes[BOXNAME.mediadata]?.delete(mediaa.mid);
  }

  static Future<List<Media>> getMediasData() async {
    final List<Media> data = Global.boxes[BOXNAME.mediadata]!.keys
        .map(
          (e) => Media(
            mediaId: Global.boxes[BOXNAME.mediadata]!.get(e).mediaId,
            mediaTitle: Global.boxes[BOXNAME.mediadata]!.get(e).mediaTitle,
            mid: Global.boxes[BOXNAME.mediadata]!.get(e).mid,
            createdAt: Global.boxes[BOXNAME.mediadata]!.get(e).createdAt,
          ),
        )
        .toList();

    return data;
  }
}
