import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracecost_app/models/media.dart';

class Global {
  static late Box _mediadata;

  static initialiseHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(MediaAdapter());

    _mediadata = await Hive.openBox('media_data');
  }

  static Box get mediadata {
    return _mediadata;
  }

  static Map<BOXNAME, Box> boxes = {
    BOXNAME.mediadata: mediadata,
  };
}

enum BOXNAME {
  mediadata,
}
