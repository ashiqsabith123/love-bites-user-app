import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:love_bites_user_app/data/data_providers/get_matches/get_matches_data_provider.dart';
import 'package:love_bites_user_app/data/data_providers/make_interest/make_interest_data_provider.dart';
import 'package:love_bites_user_app/data/models/common_response_model/common_response_model.dart';
import 'package:love_bites_user_app/data/models/match_response_model/match_response_model.dart';

import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

final List<List<Widget>> images = [];
MatchResponseModel resp = MatchResponseModel();

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  GetMathcesProvider getMathcesProvider = GetMathcesProvider();
  MakeInterstProvider makeInterstProvider = MakeInterstProvider();
  HomePageBloc() : super(HomePageInitial()) {
    on<SelectPage>((event, emit) {
      emit(PageSelectedState(index: event.index));
    });

    on<MakeIntrest>((event, emit) async {
      emit(MakingIntrest());
      final resp =
          await makeInterstProvider.makeInterest(event.recieverID.toString());
      await Future.delayed(const Duration(seconds: 1));
      emit(MadeIntrest(responseModel: resp));
    });

    on<FetchMatches>((event, emit) async {
      emit(FetchingMatches());
      resp = await getMathcesProvider.getMatches();

      if (resp.status == 200 && resp.data?.matchedUsers != null) {
        for (int i = 0; i < resp.data!.matchedUsers!.length; i++) {
          final List<Widget> image = [];
          for (int j = 0;
              j < resp.data!.matchedUsers![i].userImages!.length;
              j++) {
            image.add(CachedNetworkImage(
              colorBlendMode: BlendMode.clear,
              fit: BoxFit.fill,
              imageUrl:
                  "https://love-bites-bucket.s3.us-east-2.amazonaws.com/${resp.data!.matchedUsers![i].userImages![j].imageId}.jpeg",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  LoadingAnimationWidget.hexagonDots(
                      color: Colors.black, size: 50),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ));
          }
          images.add(image);
        }
      }

      emit(MatchesFetched(resp: resp, images: images));
    });
  }
}
