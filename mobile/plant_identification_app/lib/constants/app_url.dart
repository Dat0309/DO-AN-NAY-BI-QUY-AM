// ignore_for_file: constant_identifier_names

class AppUrl {
  static const String FAST_API = "http://192.168.1.8:8080";
  static const String RECOGNITION =
      "$FAST_API/api/v1/agriculture-recognition/agriculture-recognition/multi-recognition";
  static const String AGRICULTURE_API =
      "https://agriculture-identity.vercel.app/";
  static const String GET_ALL_AGRICULTURE =
      "$AGRICULTURE_API/api/v1/agriculture";
  static const String GET_AGRICULTURE_BY_SPECIFICNAME =
      "$AGRICULTURE_API/api/v1/agriculture/get-by-name";

      static const String GET_AGTICULTURE_BY_TYPE = "$AGRICULTURE_API/api/v1/agriculture/type-id";
}
