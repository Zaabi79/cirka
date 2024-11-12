import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'service/service.dart';

/// App starts
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializePushNotificationService();
  SharedPreferences sharedPref = await getSharedPref();

  await AppServiceInject.create(
    PreferenceModule(sharedPref: sharedPref),
    NetworkModule(),
  );

  runApp(AppServiceInject.instance.getApp);
}
