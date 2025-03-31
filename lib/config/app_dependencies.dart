import 'package:flutter_mvvm_template/data/services/remote/api_client_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [Provider(create: (context) => ApiClientService())];
}
