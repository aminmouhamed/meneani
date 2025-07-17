import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meneani/core/errors/failures.dart';
import 'package:meneani/features/auth/signup/domain/entiti/client_entiti.dart';
import 'package:meneani/features/auth/signup/domain/entiti/specialist_entiti.dart';
import 'package:meneani/features/auth/signup/domain/repository/create_account_repository.dart';
import 'package:meneani/features/auth/signup/domain/usecase/create_client_account_usecase.dart';
import 'package:meneani/features/auth/signup/domain/usecase/create_specialist_account_usecase.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  late TextEditingController fName = TextEditingController();
  late TextEditingController lName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController age = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController gender = TextEditingController();
  late TextEditingController nationalId = TextEditingController();
  late TextEditingController specialistType = TextEditingController();
  late TextEditingController address = TextEditingController();
  late TextEditingController deplomatId = TextEditingController();
  final CreateAccountRepository repository;
  CreateAccountBloc(this.repository) : super(CreateAccountInitial()) {
    on<CreateAccountEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is CreateClientAccountEvent) {
        emit(CreateAccountLoadingState());

        var response =
            await CreateClientAccountUseCase(
              createAccountRepository: repository,
            ).call(
              ClientEntiti(
                phone: phone.text,
                password: password.text,
                uFName: fName.text,
                uLName: lName.text,
                uNationalId: nationalId.text,
                uAge: age.text,
                uGender: gender.text,
                email: email.text,
              ),
            );
        response.fold(
          (failure) {
            if (failure is ServerFailure) {
              emit(CreateAccountErrorState(errorMessage: failure.errorMassege));
            }
          },
          (val) {
            emit(CreateAccountLoadedState());
          },
        );
      } else if (event is CreateSpecialistAccountEvent) {
        var response =
            await CreateSpecialistAccountUsecase(
              createAccountRepository: repository,
            ).call(
              SpecialistEntiti(
                phone: phone.text,
                password: password.text,
                uFName: fName.text,
                uLName: lName.text,
                uNationalId: nationalId.text,
                uDiplomaId: deplomatId.text,
                uAge: age.text,
                uGender: gender.text,
                uSpecialistType: specialistType.text,
                uSpecialistAddress: address.text,
                uEmail: email.text,
              ),
            );
      }
    });
  }

  @override
  Future<void> close() {
    fName.dispose();
    lName.dispose();
    email.dispose();
    password.dispose();
    nationalId.dispose();
    address.dispose();
    deplomatId.dispose();
    gender.dispose();
    age.dispose();
    specialistType.dispose();
    return super.close();
  }
}
