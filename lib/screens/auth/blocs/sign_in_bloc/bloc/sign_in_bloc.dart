import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repo/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInLoading());
      try {
        await _userRepository.signIn(event.email, event.password);
      } catch (e) {
        emit(SignInFailure());
      }
    });
    on<SignOut>((event, emit) async => _userRepository.logOut());
  }
}
