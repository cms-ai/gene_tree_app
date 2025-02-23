// ignore_for_file: avoid_print

import 'dart:io';
import 'package:gene_tree_app/modules/common/extensions/string_extensions.dart';

part 'helpers.dart';

void main() {
  print("Tính năng tạo template");
  print("======================================================");
  print("0. Exit");
  print("1. Tạo 1 màn hình đơn giản");
  print("2. Tạo 1 màn hình (có sử dụng bloc)");
  print("3. Tạo 1 bloc");
  print("4. Tạo component");
  print("5. Thêm api mới vào file có sẵn");
  print("======================================================");

  String? inputSelection;
  bool isInputValueValid = false;

  inputSelection = stdin.readLineSync()?.trim();

  do {
    switch (inputSelection) {
      case "q":
      case "0":
        exit(0);
      case "1":
        _CreateFileHelper.createFile(
          templatePath:
              "bin/templates/screen_templates/full_page_folder/simple/file_name/blfile_name_bloc.dart.tmpl",
          destinationPath: "lib/modules/common/theme/ai.dart",
          from: [
            RegExp(r'\$ClassName\$'),
            RegExp(r'\$FileName\$'),
          ],
          replace: [],
        );
        isInputValueValid = true;
        break;

      case "2":
        isInputValueValid = true;
        _CreateFileHelper.createScreenWithBloc();
        break;

      case "3":
        // Tạo một bloc
        isInputValueValid = true;
        _CreateFileHelper.createBloc();
        break;
      case "4":
        isInputValueValid = true;
        _CreateFileHelper.createComponent();

        break;
      case "5":
        isInputValueValid = true;
        _CreateFileHelper.createApi();
      default:
    }
  } while (!isInputValueValid);
}
