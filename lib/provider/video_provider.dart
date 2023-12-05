
import 'package:flutter/material.dart';
import 'package:flutter_test_2/data/model/response/base/api_response.dart';
import 'package:flutter_test_2/data/model/video_model.dart';
import 'package:flutter_test_2/data/repository/video_repo.dart';


class VideoProvider with ChangeNotifier {
  final VideoRepo videoRepo;
  VideoProvider({required this.videoRepo});


  int position = 0;
  List<VideoModel> videoList = [];
  bool isLoading = false;
  bool isBottomLoading = false;
  int selectPage = 1;
  bool hasNextData = false;

  updatePageNo() {
    selectPage++;
    initializeVideo(page: selectPage);
    notifyListeners();
  }

  initializeVideo({int page = 1, bool isFirstTime = true}) async {
    if (page == 1) {
      selectPage = 1;
      videoList.clear();
      videoList = [];
      isLoading = true;
      hasNextData = false;
      isBottomLoading = false;
      position = 0;
      if (!isFirstTime) {
        notifyListeners();
      }
    } else {
      isBottomLoading = true;
      notifyListeners();
    }
   
    ApiResponse response = await videoRepo.getVideo(page);
    isLoading = false;
    isBottomLoading = false;
    if (response.response.statusCode == 200) {
      hasNextData = response.response.data['links']["next"]!= null ? true : false;
      response.response.data['results'].forEach((element) {
        videoList.add(VideoModel.fromJson(element));

      });
      notifyListeners();

    } else {

    }
    notifyListeners();
  }


}
