import 'package:flutter/foundation.dart';
import 'package:gene_tree_app/core/exceptions/exceptions.dart';

extension ErrorHelpers on ErrorResponse {
  String getDefaultError() {
    String errorText = message ?? "An error occurred";
    if (kDebugMode) {
      errorText += "\n($errorCode)";
    }
    return errorText;
  }
}
