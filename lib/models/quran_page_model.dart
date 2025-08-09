import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quran/quran.dart';
import 'package:qurani_app/models/surah_model.dart';
import 'package:qurani_app/models/surah_type.dart';
import 'package:qurani_app/models/verse_model.dart';

class QuranPageModel {
  final int pageNumber;
  final int juzuNumber;
  final List<SurahModel> surahs;

  QuranPageModel._({
    required this.juzuNumber,
    required this.pageNumber,
    required this.surahs,
  });

  static Future<QuranPageModel> formPageNumber(int pageNumber) async {
    List<SurahModel> surahs = [];

    List<dynamic> surahsJson = json.decode(
      await rootBundle.loadString('assets/surahs.json'),
    );

    for (var element in getPageData(pageNumber)) {
      List<VerseModel> verses = [];
      int surahNumber = element['surah'];
      for (int i = element['start']; i <= element['end']; i++) {
        verses.add(
          VerseModel(
            verseNumber: i,
            text: getVerse(surahNumber, i),
            qcf: getVerseQCF(surahNumber, i),
          ),
        );
      }
      SurahType type = switch (surahsJson[surahNumber - 1]['revelationType']) {
        'Meccan' => SurahType.makia,
        'Medinan' => SurahType.madania,
        _ => SurahType.makia,
      };
      surahs.add(
        SurahModel(
          name: SurahNames.fromJson(surahsJson[surahNumber - 1]),
          number: element['surah'],
          startVerse: element['start'],
          endVerse: element['end'],
          verses: verses,
          type: type,
        ),
      );
    }

    return QuranPageModel._(
      pageNumber: pageNumber,
      surahs: surahs,
      juzuNumber: getJuzNumber(
        surahs.first.number,
        surahs.first.verses.first.verseNumber,
      ),
    );
  }
}
