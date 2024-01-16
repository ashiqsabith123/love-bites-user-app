import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<SelectPage>((event, emit) {
      emit(PageSelectedState(index: event.index));
    });

    on<FetchMatches>((event, emit) {
      emit(FetchingMatches());
    });
  }
}
