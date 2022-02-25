class ApiEndpoints {
  static String kBaseApi = 'https://staging-api.astrotak.com/api/';
  static String askQuestionApi = kBaseApi + 'question/category/all';
  static String relativeListApi = kBaseApi + 'relative/all';
  static String addRelativeApi = kBaseApi + 'relative';

  static String updateRelativeApi({required String uuid}) =>
      kBaseApi + 'relative/update/$uuid';

  static String deleteRelativeApi({required String uuid}) =>
      kBaseApi + 'relative/delete/$uuid';

  static String placesSuggestionsApi({required String place}) =>
      kBaseApi + 'location/place?inputPlace=$place';
}
