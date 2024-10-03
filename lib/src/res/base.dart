import '../utils/config.dart';

class BasePaths {
  static const baseImagePath = "assets/images";
  static const baseProdUrl = "";
  static const baseTestUrl = "";
  static const baseUrl = AppConfig.devMode ? baseTestUrl : baseProdUrl;
}
