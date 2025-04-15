import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mvvm_template/utils/log_util.dart';

Future<void> bootApp() async {
  final DateTime start = DateTime.timestamp();
  LogUtil.instance.i('App booting...');
  await dotenv.load();

  final DateTime end = DateTime.timestamp();
  LogUtil.instance.i('App booted in ${end.difference(start).inMilliseconds}ms');
}
