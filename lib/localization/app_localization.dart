import 'package:training/localization/ar/ar_translations.dart';

import '../core/app_export.dart';
import 'en_us/en_us_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en_US': enUs,
  'ar': ar
  
  };
  
}
