abstract class BaseApiService {
  Future<dynamic> getApi(String url);

  Future<dynamic> getQueryApi(String url, var query);

  Future<dynamic> postApi(String url, var req);
}
