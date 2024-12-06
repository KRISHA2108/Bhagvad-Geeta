import 'package:bhagavad_geeta/routes/routes.dart';
import 'package:bhagavad_geeta/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeProvider>().getChapters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: const Image(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.fill),
          ),
          // Container(
          //     height: double.infinity,
          //     width: double.infinity,
          //     decoration: BoxDecoration(
          //       color: Colors.black.withOpacity(0.2),
          //     )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        context.watch<HomeProvider>().isEnglish
                            ? "Bhagavad Geeta"
                            : "श्रीमद् भगवद् गीता",
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {},
                          child: const Text(
                            "Language",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            context.read<HomeProvider>().changeLanguage(true);
                          },
                          child: const Text(
                            "English",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          onTap: () {
                            context.read<HomeProvider>().changeLanguage(false);
                          },
                          child: const Text(
                            "Hindi",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      onSelected: (value) {
                        if (value == 0) {
                          context.read<HomeProvider>().changeLanguage(value);
                        }
                        if (value == 1) {
                          context.read<HomeProvider>().changeLanguage(value);
                        }
                      },
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: context.watch<HomeProvider>().chapters.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        context.read<HomeProvider>().selectVerses(context
                            .read<HomeProvider>()
                            .chapters[index]
                            .chapter_number!);

                        Navigator.pushNamed(context, Routes.detail,
                            arguments: index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 45,
                            width: 45,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              backgroundImage: AssetImage(context
                                  .read<HomeProvider>()
                                  .chapters[index]
                                  .img!),
                            ),
                          ),
                          title: Text(
                            context.watch<HomeProvider>().isEnglish
                                ? "${context.read<HomeProvider>().chapters[index].image_name?.toUpperCase()}"
                                : "${context.read<HomeProvider>().chapters[index].name}",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            context.watch<HomeProvider>().isEnglish
                                ? "Verses:${context.read<HomeProvider>().chapters[index].verses_count} "
                                : " छन्दः ${context.read<HomeProvider>().chapters[index].verses_count}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
