import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_2/component/cusom_text_field.dart';
import 'package:flutter_test_2/component/custom_space.dart';
import 'package:flutter_test_2/provider/video_provider.dart';
import 'package:flutter_test_2/screens/home/widget/custom_avater.dart';
import 'package:flutter_test_2/screens/home/widget/custom_video_placeholder.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ViewVideoScreen extends StatefulWidget {
  final int videoIndex;
  const ViewVideoScreen({super.key, required this.videoIndex});

  @override
  State<ViewVideoScreen> createState() => _ViewVideoScreenState();
}

class _ViewVideoScreenState extends State<ViewVideoScreen> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    var provider = Provider.of<VideoProvider>(context, listen: false);
    VideoPlayerController videoPlayerController =
        VideoPlayerController.networkUrl(
            Uri.parse(provider.videoList[widget.videoIndex].manifest!));

    _chewieController = ChewieController(

      autoInitialize: true,
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      placeholder: CustomVideoPlaceHolder(imageUrl: provider.videoList[widget.videoIndex].thumbnail),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
              gap(hight: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${provider.videoList[widget.videoIndex].title}",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${provider.videoList[widget.videoIndex].viewers} views",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        gap(width: 20),
                        Text(
                            "${DateTime.now().compareTo(provider.videoList[widget.videoIndex].dateAndTime!)} days ago",
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    gap(hight: 10),
                    Row(
                      children: [

                        Container(
                          decoration: BoxDecoration(color:Colors.white, border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                SvgPicture.asset("assets/svg/love.svg",height: 24,width: 24,),
                                Text("Mash Allah (12k)",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color(0xff718096)),)
                              ],
                            ),
                          ),),
                        gap(width: 10),
                        Container(
                          decoration: BoxDecoration(color:Colors.white, border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                SvgPicture.asset("assets/svg/like.svg",height: 24,width: 24,),
                                Text("LIKE (12k)",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color(0xff718096)),)
                              ],
                            ),
                          ),),
                        gap(width: 10),
                        Container(
                          decoration: BoxDecoration(color:Colors.white, border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                SvgPicture.asset("assets/svg/share.svg",height: 24,width: 24,),
                                Text("SHARE",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color(0xff718096)),)
                              ],
                            ),
                          ),),
                        gap(width: 10),
                        Container(
                          decoration: BoxDecoration(color:Colors.white, border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                SvgPicture.asset("assets/svg/love.svg",height: 24,width: 24,),
                                Text("REPORT",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: const Color(0xff718096)),)
                              ],
                            ),
                          ),),
                      ],
                    ),
                    gap(hight: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: -2,
                            child: Container(
                                child: avatar(provider.videoList[widget.videoIndex].channelImage!))),
                        gap(width: 10),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${provider.videoList[widget.videoIndex].channelName}",style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 14),),
                              gap(hight: 3),
                              Text("${provider.videoList[widget.videoIndex].channelSubscriber} Subscribers",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12,color: Colors.grey),)
                            ],
                          ),
                        ),
  Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        onPressed: (){}, child: Text("+Subscribe",style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white,fontSize: 10),)),
  )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Comments   7.5K",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff718096)),),
                      SvgPicture.asset("assets/svg/updown.svg"),
                    ],
                    ),
                    gap(hight: 10),
                    const CustomTextField(
                      fillColor: Colors.white,
                      borderRadius: 2,
                      isIcon: true,
                      isShowSuffixIcon: true,
                      suffixIconUrl: "assets/svg/aroplane.svg",
                    ),
gap(hight: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        avatar(provider.videoList[widget.videoIndex].thumbnail!),
                        gap(width: 10),
                        Column( mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Fahmida khanom",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey,fontWeight:FontWeight.w500,fontSize: 12),),
                                Text("   2 days ago",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey,fontWeight:FontWeight.w400,fontSize: 8),)
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*.7,
                                child: Text("হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff4A5568),fontWeight:FontWeight.w400,fontSize: 12),)),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
