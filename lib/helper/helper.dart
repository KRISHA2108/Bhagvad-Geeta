import 'dart:convert';
import 'package:bhagavad_geeta/model/chapters_model.dart';
import 'package:bhagavad_geeta/model/verses_model.dart';
import 'package:flutter/services.dart';

class ShrHelper {
  Future<List<ChapterModel>> getData() async {
    String jsonString =
        await rootBundle.loadString('assets/json/chapters.json');
    List json = jsonDecode(jsonString);
    List<ChapterModel> chapters =
        json.map((e) => ChapterModel.mapToModel(e)).toList();
    return chapters;
  }

  Future<List<VersesModel>> getVerseData() async {
    String jsonString = await rootBundle.loadString('assets/json/verses.json');
    List json = jsonDecode(jsonString);
    List<VersesModel> verses =
        json.map((e) => VersesModel.mapToModel(e)).toList();
    return verses;
  }
}
