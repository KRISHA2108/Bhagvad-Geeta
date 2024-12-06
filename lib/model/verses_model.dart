class VersesModel {
  int? chapter_id;
  int? chapter_number;
  int? externalId;
  int? id;
  String? text;
  String? title;
  int? verse_number;
  int? verse_order;
  String? transliteration;
  String? word_meanings;

  VersesModel(
      {this.chapter_id,
      this.chapter_number,
      this.externalId,
      this.id,
      this.text,
      this.title,
      this.verse_number,
      this.verse_order,
      this.transliteration,
      this.word_meanings});

  factory VersesModel.mapToModel(Map m1) {
    return VersesModel(
      chapter_id: m1['chapter_id'],
      chapter_number: m1['chapter_number'],
      externalId: m1['externalId'],
      id: m1['id'],
      text: m1['text'],
      title: m1['title'],
      verse_number: m1['verse_number'],
      verse_order: m1['verse_order'],
      transliteration: m1['transliteration'],
      word_meanings: m1['word_meanings'],
    );
  }
}
