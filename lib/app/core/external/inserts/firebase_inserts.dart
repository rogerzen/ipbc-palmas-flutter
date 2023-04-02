import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../lyric/infra/adapters/firestore-dtos/lyric_dto_adapter.dart';
import '../../../lyric/infra/adapters/firestore-dtos/service_dto_adapter.dart';
import '../../../../firebase_options.dart';
import '../../../lyric/infra/models/firestore-dtos/lyric_dto.dart';
import '../../../lyric/infra/models/firestore-dtos/service_dto.dart';
import '../../../shared/components/utils/verses_util.dart';
import '../firestore_datasource.dart';

Future<void> firebaseInitialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (details) {
    log(
      details.exceptionAsString(),
      stackTrace: details.stack,
    );
  };
}

Future<DateTime> dateNow() async {
  return Future.delayed(
    const Duration(seconds: 2),
    () => Timestamp.now().toDate(),
  );
}
//alterar IDS que estao como String para int
void main() async {

  await firebaseInitialize();

  FirestoreDatasource fire = FirestoreDatasource(firestore: FirebaseFirestore.instance);

  String lyricsUrl = 'lyrics';
  String saturdayServiceUrl = 'saturday-services';
  String morningSundayServiceUrl = 'morning-sunday-services';
  String eveningSundayServiceUrl = 'evening-sunday-services';

  try {

    final String saturdayJson = await rootBundle.loadString('assets/data/saturday-service.json');
    final String sundayEveningJson = await rootBundle.loadString('assets/data/sunday-evening-service.json');
    final String sundayMorningJson = await rootBundle.loadString('assets/data/sunday-morning-service.json');

    List<ServiceDTO> services = [];
    List<ServiceDTO> servicesAux = [];
    List<LyricDTO> lyricsAux = [];
    List<LyricDTO> allLyricsInserted = [];
    services.add(ServiceDTOAdapter.fromJson(saturdayJson));
    services.add(ServiceDTOAdapter.fromJson(sundayEveningJson));
    services.add(ServiceDTOAdapter.fromJson(sundayMorningJson));

    for (int column = 0; services.length > column ; column++){
      List<LyricDTO> lyricsConverted = await VersesUtil.generateVersesList(services[column].lyricsList);
      lyricsAux = [];
      //aqui vai o codigo para alterar a capa do album
      for (int line = 0; services[column].lyricsList.length > line; line++) {
        lyricsAux.add(
          services[column].lyricsList[line].copyWith(
            id: lyricsConverted[line].id,
            verses: lyricsConverted[line].verses,
            albumCover: lyricsConverted[line].albumCover,
          ),
        );
      }
      allLyricsInserted.addAll(lyricsAux);
      servicesAux.add(services[column].copyWith(id: '$column',lyricsList: lyricsAux));
    }

    /*for (LyricDTO lyric in allLyricsInserted) {
    fire.add(lyricsUrl, LyricDTOAdapter.toMap(lyric));
    }*/

    print('Total number of lyrics inserted: ${allLyricsInserted.length}');

    fire.add(saturdayServiceUrl, ServiceDTOAdapter.toMap(servicesAux[0]));
    fire.add(eveningSundayServiceUrl, ServiceDTOAdapter.toMap(servicesAux[1]));
    fire.add(morningSundayServiceUrl, ServiceDTOAdapter.toMap(servicesAux[2]));

    print('Services and lyrics have been added successfully');

  }catch(e){
    print('$e');
  }
}
