import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:studydeck_app/ui/utils/helper/helper.dart';

class FirebaseService {
  final storage = FirebaseStorage.instance;

  Future<String?> uploadFile(File file, {String? customPath}) async {
    try {
      final now = DateTime.now().toIso8601String();
      final ref =
          storage.ref('${customPath ?? ''}${file.path.split('/').last}-$now');
      print(file.path.split('/').last);

      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (error) {
      await showCustomDialog(
        'Beim Hochladen der Datei ist ein Fehler aufgetreten.',
        title: 'Etwas ist schief gelaufen',
      );
      return null;
    }
  }
}
