import 'package:news_bytes/src/view.dart';

class YetAnotherController extends ControllerMVC {
  /// It's a good practice to make Controllers using the Singleton pattern
  factory YetAnotherController() => _this ??= YetAnotherController._();
  YetAnotherController._() : super();
  static YetAnotherController? _this;

  /// Used to complete asynchronous operations
  @override
  Future<bool> initAsync() async {
    super.initAsync();
    throw "An error in initializing the Controller's synchronous operations!";
  }

  /// Supply an 'error handler' routine if something goes wrong
  /// in the corresponding initAsync() routine.
  // The error is only for testing purposes and so pretend it was handled.
  @override
  bool onAsyncError(FlutterErrorDetails details) => true;
}
