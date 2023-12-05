import 'package:flutter/material.dart';
import 'package:flutter_test_2/component/custom_space.dart';
import 'package:flutter_test_2/provider/video_provider.dart';
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
                      ListView.builder(
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
                                    Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(provider
                                                  .videoList[index]
                                                  .thumbnail!))),
                                    )
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
