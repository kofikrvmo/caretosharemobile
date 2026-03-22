import 'package:flutter/material.dart';
import 'package:caretosharemobile/core/config/app_environment.dart';
import 'package:caretosharemobile/core/services/service_locator.dart';
import 'package:caretosharemobile/core/utils/enums/app_environment.dart';
import 'package:caretosharemobile/care_to_share_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ConfigEnvironments.initialize(AppEnvironment.development);
  await initializeDateFormatting('en_US', null);
  setup();
  runApp(const CareToShareApp());
}
