import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:item_repo/item_repository.dart';

part 'get_items_event.dart';
part 'get_items_state.dart';

class GetItemsBloc extends Bloc<GetItemsEvent, GetItemsState> {
  final ItemRepo _itemRepo;

  GetItemsBloc(this._itemRepo) : super(GetItemsInitial()) {
    on<GetItemsEvent>((event, emit) async {
      emit(GetItemsLoading());
      try {
        List<Items> items = await _itemRepo.getItems();
        emit(GetItemsSuccess(items));
      } catch (e) {
        emit(GetItemsFailure());
      }
    });
  }
}
