import 'package:bhagavad_geeta/helper/helper.dart';
import 'package:bhagavad_geeta/model/chapters_model.dart';
import 'package:bhagavad_geeta/model/verses_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeProvider with ChangeNotifier {
  ShrHelper helper = ShrHelper();
  List<List<String>> images = [
    [
      "assets/images/ch_1(1).jpg",
      "assets/images/ch_1(2).jpg",
      "assets/images/ch_1(3).jpg",
    ],
    [
      "assets/images/ch_2(1).jpg",
      "assets/images/ch_2(2).jpg",
      "assets/images/ch_2(3).jpg",
    ],
    [
      "assets/images/ch_3(1).jpg",
      "assets/images/ch_3(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_4(1).jpg",
      "assets/images/ch_4(2).jpg",
      "assets/images/ch_4(3).jpg",
    ],
    [
      "assets/images/ch_5(1).jpg",
      "assets/images/ch_5(2).jpg",
      "assets/images/ch_5(3).jpg",
    ],
    [
      "assets/images/ch_6(1).jpg",
      "assets/images/ch_6(2).jpg",
      "assets/images/ch_6(3).jpg",
    ],
    [
      "assets/images/ch_7(1).jpg",
      "assets/images/ch_7(2).jpg",
      "assets/images/ch_2(2).jpg",
    ],
    [
      "assets/images/ch_8(1).jpg",
      "assets/images/ch_8(2).jpg",
      "assets/images/ch_8(3).jpg",
    ],
    [
      "assets/images/ch_9(1).jpg",
      "assets/images/ch_9(2).jpg",
      "assets/images/ch_9(3).jpg",
    ],
    [
      "assets/images/ch_10(1).jpg",
      "assets/images/ch_10(2).jpg",
      "assets/images/ch_10(3).jpg",
    ],
    [
      "assets/images/ch_11(1).jpg",
      "assets/images/ch_11(2).jpg",
      "assets/images/ch_11(3).jpg",
    ],
    [
      "assets/images/ch_12(1).jpg",
      "assets/images/ch_12(2).jpg",
      "assets/images/ch_12(3).jpg",
      "assets/images/ch_12(4).jpg",
    ],
    [
      "assets/images/ch_13(1).jpg",
      "assets/images/ch_13(2).jpg",
      "assets/images/ch_13(3).jpg",
    ],
    [
      "assets/images/ch_14(1).jpg",
      "assets/images/ch_14(2).jpg",
      "assets/images/ch_14(3).jpg",
    ],
    [
      "assets/images/ch_15(1).jpg",
      "assets/images/ch_15(2).jpg",
    ],
    [
      "assets/images/ch_16(1).jpg",
      "assets/images/ch_16(2).jpg",
      "assets/images/ch_16(3).jpg",
    ],
    [
      "assets/images/ch_17(1).jpg",
      "assets/images/ch_17(2).jpg",
      "assets/images/ch_17(3).jpg",
    ],
    [
      "assets/images/ch_18(1).jpg",
      "assets/images/ch_18(2).jpg",
      "assets/images/ch_18(3).jpg",
    ],
  ];
  List<ChapterModel> chapters = [];
  List<VersesModel> verses = [];
  List<VersesModel> selectedVerses = [];
  bool isEnglish = false;

  FlutterTts flutterTts = FlutterTts();

  void changeLanguage(bool value) {
    isEnglish = value;
    notifyListeners();
  }

  void speak(String text) {
    flutterTts.speak(text);
    notifyListeners();
  }

  void selectVerses(int num) {
    selectedVerses =
        verses.where((element) => element.chapter_number == num).toList();
    notifyListeners();
  }

  Future<void> getChapters() async {
    chapters = await helper.getData();
    notifyListeners();
  }

  Future<void> getVerses() async {
    verses = await helper.getVerseData();
    notifyListeners();
  }
}
