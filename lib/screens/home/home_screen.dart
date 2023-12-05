import 'package:flutter/material.dart';
import 'package:flutter_test_2/component/custom_space.dart';
import 'package:flutter_test_2/provider/video_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  ScrollController listController = ScrollController();
  Future<void> _refresh(BuildContext context) async {
    Provider.of<VideoProvider>(context, listen: false)
        .initializeVideo(isFirstTime: false);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refresh(context);
      controller.addListener(() {
        if (controller.offset >= controller.position.maxScrollExtent &&
            !controller.position.outOfRange &&
            Provider.of<VideoProvider>(context, listen: false).hasNextData) {
          Provider.of<VideoProvider>(context, listen: false).updatePageNo();
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Consumer<VideoProvider>(builder: (context, provider, child) {
        return RefreshIndicator(
          onRefresh: () {
            return _refresh(context);
          },
          child: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SingleChildScrollView(
                  controller: controller,
                  child: Column(
                    children: [
                      Text(
                        "Trending Videos",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      gap(hight: 16),
                      ListView.separated(
                        padding:EdgeInsets.zero ,
                        separatorBuilder: (context,index){
                          return gap(hight: 10);
                        },
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: provider.videoList.length + 1,
                          itemBuilder: (context, index) {
                            if (index == provider.videoList.length) {
                              return const SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(),
                                    ],
                                  ));
                            } else {
                              return Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: 200,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(provider
                                                      .videoList[index]
                                                      .thumbnail!))),
                                        ),
                                        Positioned(
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
                                                  "${provider.videoList[index].duration}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    gap(hight: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(

                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: NetworkImage(provider
                                                        .videoList[index]
                                                        .channelImage!)),
                                                color: Colors.green),

                                          ),
                                        ),
                                        Expanded(
                                          flex:4,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${provider.videoList[index].title}"),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text("${provider.videoList[index].viewers} views",style: const TextStyle(color: Colors.grey),),
                                                  gap(width: 20),
                                                  Text(DateFormat('MMM d, y').format(provider.videoList[index].dateAndTime!),style: const TextStyle(color: Colors.grey)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            child: IconButton(onPressed: (){

                                            }, icon: const Icon(Icons.more_vert,color: Colors.grey)))

                                      ],
                                    ),
                                    gap(hight: 16),
                                  ],
                                ),
                              );
                            }
                          }),
                    ],
                  ),
                )),
          ),
        );
      }),
    );
  }
}
