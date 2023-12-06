
import 'package:flutter/material.dart';
import 'package:flutter_test_2/component/custom_space.dart';
import 'package:flutter_test_2/screens/home/widget/custom_avater.dart';
import 'package:intl/intl.dart';

class CustomVideoPlaceHolder extends StatelessWidget {
  final String? imageUrl;
  final String? videoDuration;
  final bool? isBottomShow;
  final String? videoTitle;
  final String? videoViews;
  final DateTime? videoDate;
  final String? channelImage;
  final VoidCallback? onclick;

  const CustomVideoPlaceHolder({super.key,
    this.imageUrl,
    this.videoDuration,
    this.isBottomShow = false,
    this.videoTitle,
    this.videoViews,
    this.videoDate,
    this.channelImage,
    this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: imageUrl!=null?BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageUrl!),
                )):const BoxDecoration(color: Colors.grey)
                  ),
                videoDuration!=null? Positioned(
                    bottom: 20.0,
                    right: 20.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius:
                          BorderRadius.circular(5)),
                      child: Padding(
                        padding:
                        const EdgeInsets.all(4.0),
                        child: Text(
                          "${videoDuration}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: Colors.white),
                        ),
                      ),
                    )):const SizedBox.shrink()
              ],
            ),
            gap(hight: 16),
            isBottomShow!? Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(

                    child: channelImage!=null?avatar(channelImage!):const SizedBox.shrink()
                ),
                Expanded(
                  flex:4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     videoTitle!=null? Text("$videoTitle"):const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          videoViews!=null?Text("${videoViews} views",style: const TextStyle(color: Colors.grey),):const SizedBox.shrink(),
                          gap(width: 20),
                         videoDate!=null? Text(DateFormat('MMM d, y').format(videoDate!),style: const TextStyle(color: Colors.grey)):const SizedBox.shrink(),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: IconButton(onPressed: (){

                    }, icon: const Icon(Icons.more_vert,color: Colors.grey)))

              ],
            ):const SizedBox.shrink(),
            gap(hight: 16),
          ],
        ),
      ),
    );
  }
}
