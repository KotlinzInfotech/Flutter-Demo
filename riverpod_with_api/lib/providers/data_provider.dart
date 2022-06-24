import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_with_api/model/usermodel.dart';
import 'package:riverpod_with_api/services/ApiServices.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.read(apiProvider).getUser();
});
