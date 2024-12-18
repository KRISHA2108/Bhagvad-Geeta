class ChapterModel {
  int? chapter_number;
  String? chapter_summary;
  String? chapter_summary_hindi;
  int? id;
  String? img;
  String? image_name;
  String? name;
  String? name_translation;
  String? name_transliterated;
  int? verses_count;

  ChapterModel({
    this.chapter_number,
    this.chapter_summary,
    this.chapter_summary_hindi,
    this.id,
    this.img,
    this.image_name,
    this.name,
    this.name_translation,
    this.name_transliterated,
    this.verses_count,
  });

  factory ChapterModel.mapToModel(Map m1) {
    return ChapterModel(
      chapter_number: m1['chapter_number'],
      chapter_summary: m1['chapter_summary'],
      chapter_summary_hindi: m1['chapter_summary_hindi'],
      id: m1['id'],
      img: m1['img'],
      image_name: m1['image_name'],
      name: m1['name'],
      name_translation: m1['name_translation'],
      name_transliterated: m1['name_transliterated'],
      verses_count: m1['verses_count'],
    );
  }
}
