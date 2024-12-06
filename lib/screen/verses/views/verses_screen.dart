import 'package:bhagavad_geeta/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VersesScreen extends StatefulWidget {
  const VersesScreen({super.key});

  @override
  State<VersesScreen> createState() => _VersesScreenState();
}

class _VersesScreenState extends State<VersesScreen> {
  @override
  Widget build(BuildContext context) {
    int ind = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: const Image(
                image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.fill),
          ),
          PageView.builder(
            controller: PageController(
              initialPage: ind,
            ),
            itemCount: context.watch<HomeProvider>().selectedVerses.length,
            itemBuilder: (context, index) => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 170),
                          child: Text(
                              context.read<HomeProvider>().isEnglish
                                  ? "Verses"
                                  : "श्लोक",
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            print(
                                "${context.read<HomeProvider>().selectedVerses[ind].text!}");
                            context.read<HomeProvider>().speak(context
                                .read<HomeProvider>()
                                .selectedVerses[index]
                                .text!);
                          },
                          icon: const Icon(Icons.volume_up)),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 400,
                    width: 300,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.black,
                        image: DecorationImage(
                          image: AssetImage('assets/images/20.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      //
                      context.watch<HomeProvider>().isEnglish
                          ? "${context.read<HomeProvider>().selectedVerses[index].transliteration}"
                          : "${context.read<HomeProvider>().selectedVerses[index].text}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Word Meaning",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      context
                          .read<HomeProvider>()
                          .selectedVerses[index]
                          .word_meanings!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
