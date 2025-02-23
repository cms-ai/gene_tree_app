import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gene_tree_app/core/utils/enums/enums.dart';
import 'package:rxdart/rxdart.dart';

part 'create_clan_member_event.dart';
part 'create_clan_member_state.dart';
part 'create_clan_member_bloc.freezed.dart';

class CreateClanMemberBloc
    extends Bloc<CreateClanMemberEvent, CreateClanMemberState> {
  final _fullNameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _dateTimeController = BehaviorSubject<DateTime>();
  final _genderController = BehaviorSubject<GenderEnum>();
  final _parentIdController = BehaviorSubject<String?>();
  final _addressController = BehaviorSubject<String?>();
  final _passedAwayTimeController = BehaviorSubject<DateTime>();
  final _restingPlaceController = BehaviorSubject<DateTime>();
  final _roleController = BehaviorSubject<String>();

  // Stream Getter để truyền dữ liệu ra ngoài
  Stream<String> get fullNameStream =>
      _fullNameController.stream.transform(_validateFullName);
  Stream<String> get emailStream =>
      _emailController.stream.transform(_validateEmail);
  Stream<DateTime> get dateTimeStream => _dateTimeController.stream;
  Stream<GenderEnum> get genderStream => _genderController.stream;
  Stream<String?> get parentIdStream => _parentIdController.stream;
  Stream<String?> get addressStream => _addressController.stream;
  Stream<DateTime> get passedAwayTimeStream => _passedAwayTimeController.stream;
  Stream<DateTime> get restingPlaceStream => _restingPlaceController.stream;
  Stream<String> get roleStream => _roleController.stream;

  // Sink Getter để truyền dữ liệu vào trong các BehaviorSubject
  Function(String) get changeFullName => _fullNameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(DateTime) get changeDateTime => _dateTimeController.sink.add;
  Function(GenderEnum) get changeGender => _genderController.sink.add;
  Function(String?) get changeParentId => _parentIdController.sink.add;
  Function(String?) get changeAddress => _addressController.sink.add;
  Function(DateTime) get changePassedAwayTime =>
      _passedAwayTimeController.sink.add;
  Function(DateTime) get changeRestingPlace => _restingPlaceController.sink.add;
  Function(String) get changeRole => _roleController.sink.add;

  // Validators cho các trường dữ liệu
  final _validateFullName = StreamTransformer<String, String>.fromHandlers(
    handleData: (fullName, sink) {
      if (fullName.isEmpty || fullName.length < 3) {
        sink.addError("Họ và tên phải dài hơn 3 ký tự");
      } else {
        sink.add(fullName);
      }
    },
  );

  final _validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        sink.addError("Email không hợp lệ");
      } else {
        sink.add(email);
      }
    },
  );

  // Hàm xử lý logic khi Submit
  void submitForm() {}

  CreateClanMemberBloc() : super(const CreateClanMemberState.initial()) {
    on<CreateClanMemberEvent>((event, emit) {});
  }

  @override
  Future<void> close() {
    _fullNameController.close();
    _emailController.close();
    _dateTimeController.close();
    _genderController.close();
    _parentIdController.close();
    _addressController.close();
    _passedAwayTimeController.close();
    _restingPlaceController.close();
    _roleController.close();
    return super.close();
  }
}
