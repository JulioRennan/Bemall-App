import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../app_controller.dart';
import '../modules/shared_components/snackBars/render_error_snackbar.dart';

abstract class RestUtils extends Interceptor {
  static String baseUrl = "http://192.168.15.102:3210";

  static String errorNetwork = "network connection error";
  static String errorSever = "server connection error";

  static String messageOffline =
      'Verifique se seu dispositivo está conectado a internet. ';
  static String messageSeverError =
      "Aconteceu um erro ao se conectar com o servidor";

  bool debugRequest = false;
  bool debugReponse = false;

  Dio dio = Dio();

  RestUtils() {
    /* 
        Ao trocar dominio em alguma classe filha, 
        é necessário alterar esse valor após a chamada do construtor BaseService
    */
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
    );

    dio.options = options;

    //configuração do Interceptor em diversas etapas onRequest,onResponse, onError
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (debugRequest) showRequestInfo(options);
      return handler.next(options);
    }, onResponse: (options, handler) {
      if (debugReponse) showResponseInfo(options);
      return handler.next(options);
    }, onError: (DioError dioError,
        ErrorInterceptorHandler errorInterceptorHandler) async {
      //qualquer exception que venha do servidor é tratada em errorHandler
      errorHandler(dioError: dioError);
      return errorInterceptorHandler.next(dioError);
    }));
  }

  Map<String, String> getHeaders({bool withToken = false}) {
    ///método para pegar o header autenticado ou não.
    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };
    if (withToken) {
      String _token = AppController().token;
      headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      };
    }
    print(headers);
    return headers;
  }

  /*
    status code:
      400, 401-> exibir mensagem exception que vem do servidor
      409 -> exibir statusCode
      default -> exceções geradas por parte do servidor.
  */
  showSnackbar({required String message, Duration? duration}) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
        message: message,
        duration: duration ?? Duration(seconds: 1),
        animationDuration: Duration(
          milliseconds: 500,
        ),
      );
    }
  }

  DioError errorHandler(
      {required DioError dioError, bool connectionError = false}) {
    if (DioErrorType.connectTimeout == dioError.type ||
        DioErrorType.receiveTimeout == dioError.type) {
      showSnackbar(message: messageOffline);
      return dioError;
    } else {
      var response = dioError.response;
      print('error --> ${dioError.error}');
      print('erro na rota --> ${dioError.requestOptions.uri.path}');
      print('resposta servidor [${response!.statusCode}] --> ${response.data}');
      String message =
          response.data['message'] ?? "Aconteceu um erro inesperado :(";
      switch (response.statusCode) {
        case 404:
        case 409:
        case 401:
        case 400:
        case 503:
          renderErrorSnackbar(message);
          return dioError;
        default:
          renderErrorSnackbar(
            'Aconteceu um erro ao se conectar com o servidor :(',
          );
          return dioError;
      }
    }
  }

  //mostra informações básicas sobre a request, se o modo debugRequest == true
  void showRequestInfo(RequestOptions options) {
    print("Request[${options.method}]: ${options.path}");
    print("query params: ${options.queryParameters}");
    print("body: ${options.data}");
    print("\n");
  }

  //mostra informações básicas sobre a request, se o modo debugResponse == true
  void showResponseInfo(options) {
    print("Response status code [${options.statusCode}]");
    print("body : \n${options.data}\n");
    print("\n");
  }

  Future<dynamic> get(
    url, {
    bool withToken = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? query,
  }) async {
    var response = await dio.get(
      url,
      queryParameters: query,
      options: Options(
        headers: headers ?? getHeaders(withToken: withToken),
      ),
    );
    return response;
  }

  Future<dynamic> post(url, body,
      {Map<String, dynamic>? headers, bool withToken = false}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          headers: headers ?? getHeaders(withToken: withToken),
        ));
    return response;
  }

  Future<dynamic> put(url, body,
      {Map<String, dynamic>? headers, bool withToken = false}) async {
    var response = await dio.put(url,
        data: body,
        options: Options(headers: headers ?? getHeaders(withToken: withToken)));
    return response;
  }

  //
  Future<dynamic> patch(url, body,
      {Map<String, dynamic>? headers, bool withToken = false}) async {
    var response = await dio.patch(url,
        data: body,
        options: Options(headers: headers ?? getHeaders(withToken: withToken)));
    return response;
  }

  Future<dynamic> delete(url,
      {Map<String, dynamic>? headers, bool withToken = false}) async {
    var response = await dio.delete(url,
        options: Options(headers: headers ?? getHeaders(withToken: withToken)));
    return response;
  }
}
