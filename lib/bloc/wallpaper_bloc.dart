import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app_131/api/my_exception.dart';
import 'package:wallpaper_app_131/api/url.dart';
import 'package:wallpaper_app_131/model/photo_model.dart';

import '../api/api_helper.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  ApiHelper apiHelper;
  WallpaperBloc({required this.apiHelper}) : super(WallpaperInitialState()) {
    on<GetTrendingWallpaper>((event, emit) async {
      emit(WallpaperLoadingState());
      try {
        var res = await apiHelper.getApi(url: "${Urls.trendingWallpaper}");
        emit(
            WallpaperLoadedState(wallpaperModel: DataPhotoModel.fromJson(res)));
      } catch (e) {
        if (e is FetchDataException) {
          emit(WallpaperInterErrorState(errorMsg: e.toString()));
        } else {
          emit(WallpaperErrorState(errorMsg: e.toString()));
        }
      }
    });
  }
}
