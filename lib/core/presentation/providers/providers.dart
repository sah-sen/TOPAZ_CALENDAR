import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:topazapp/core/presentation/res/app_config.dart';
import 'package:topazapp/core/presentation/res/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:topazapp/features/auth/data/model/user_repository.dart';
import 'package:topazapp/features/notification/data/service/push_notification_service.dart';

final analyticsProvider = Provider((ref) => FirebaseAnalytics());
final pnProvider = Provider((ref) => PushNotificationService());

final userRepoProvider = ChangeNotifierProvider<UserRepository>((ref) {
  final notifService = ref.watch(pnProvider);
  return UserRepository.instance(notifService);
});
final configProvider = Provider<AppConfig>((ref) => AppConfig(
      appTitle: AppConstants.appName,
      buildFlavor: AppFlavor.prod,
    ));
