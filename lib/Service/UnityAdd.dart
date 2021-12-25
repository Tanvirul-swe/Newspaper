import 'package:flutter/foundation.dart';

class AdManager {
  static String get gameId {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return '4459133';
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return '4459132';
    }
    return '';
  }

  static String get bannerAdPlacementId {
    return 'Banner_Android';
  }

  static String get interstitialVideoAdPlacementId {
    return 'Interstitial_Android';
  }

  static String get rewardedVideoAdPlacementId {
    return 'Rewarded_Android';
  }
}