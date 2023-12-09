import 'package:bloc/bloc.dart';
import 'package:love_bites_user_app/data/data_providers/get_location/get_location_provider.dart';
import 'package:love_bites_user_app/data/models/location_response_model/location_response_model.dart';
import 'package:meta/meta.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  GetLocationProvider getLocationProvider = GetLocationProvider();
  UserDetailsBloc() : super(UserDetailsInitial()) {
    on<GetLocation>((event, emit) async {
      LocationResponseModel locationResponseModel =
          await getLocationProvider.getLocation();
      print("hello ${locationResponseModel.district}");
      emit(LocationFetchedState(locationResponseModel: locationResponseModel));
    });
  }
}
