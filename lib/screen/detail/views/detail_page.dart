import 'package:bhagavad_geeta/routes/routes.dart';
import 'package:bhagavad_geeta/screen/home/provider/home_provider.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    context.read<HomeProvider>().getChapters();
    context.read<HomeProvider>().getVerses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int chIndex = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Detail"),
      // ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: const Image(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.fill),
          ),
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        context.watch<HomeProvider>().isEnglish
                            ? "${context.read<HomeProvider>().chapters[chIndex].image_name?.toUpperCase()}"
                            : "${context.read<HomeProvider>().chapters[chIndex].name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        )),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FanCarouselImageSlider.sliderType1(
                  imagesLink: context.read<HomeProvider>().images[chIndex],
                  isAssets: true,
                  autoPlay: true,
                  sliderHeight: 250,
                  sliderWidth: double.infinity,
                  currentItemShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(3, 3),
                    ),
                  ],
                  sliderDuration: const Duration(milliseconds: 200),
                  imageRadius: 30,
                  slideViewportFraction: 0.8,
                  indicatorActiveColor: const Color(0xff5E1916),
                  indicatorDeactiveColor: Colors.black,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    " ${context.watch<HomeProvider>().isEnglish ? "Verses" : "श्लोक"} ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "${context.read<HomeProvider>().isEnglish ? context.read<HomeProvider>().chapters[chIndex].chapter_summary : context.read<HomeProvider>().chapters[chIndex].chapter_summary_hindi}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemCount: context.watch<HomeProvider>().selectedVerses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.verses,
                          arguments: index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Row(
                        children: [
                          // const CircleAvatar(
                          //   radius: 20,
                          //   backgroundColor: Colors.black,
                          //   backgroundImage: AssetImage("assets/images/1b.jpg"),
                          // ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          Text(
                            " ${context.watch<HomeProvider>().isEnglish ? "Verses" : "श्लोक"} ${index + 1}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
