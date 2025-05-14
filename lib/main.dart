import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:kullaniciapp1/snackBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil Uygulamasi',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const ProfilSayfasi(),
    );
  }
}

class ProfilSayfasi extends StatefulWidget {
  const ProfilSayfasi({super.key});

  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final _isimController = TextEditingController();
  final _biyografiController = TextEditingController();

  XFile? _pickedImage;
  Uint8List? _webImage;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _resimSec() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      if (kIsWeb) {
        final bytes = await picked.readAsBytes();
        setState(() {
          _webImage = bytes;
          _pickedImage = picked;
        });
      } else {
        setState(() {
          _pickedImage = picked;
        });
      }
    }
  }

  Future<void> _profilGuncelle() async {
    if (_isimController.text.isEmpty || _biyografiController.text.isEmpty) {
      gosterSnackBar(context, "isim ve biyografi boş birakilamaz.");
      return;
    }

    try {
      String? resimUrl;

      if (_pickedImage != null) {
        final ref = _storage
            .ref()
            .child('profil_resimleri')
            .child(DateTime.now().toIso8601String());

        if (kIsWeb && _webImage != null) {
          await ref.putData(_webImage!);
        } else {
          // dart:io'yu kullanamıyoruz, bu kısmı sadece mobilde test et
          await ref.putData(await _pickedImage!.readAsBytes());
        }

        resimUrl = await ref.getDownloadURL();
      }

      await _firestore.collection('kullanicilar').doc('kullanici_id').set({
        'isim': _isimController.text,
        'biyografi': _biyografiController.text,
        'profilResimUrl': resimUrl ?? '',
      });

      gosterSnackBar(context, "Profil basariyla guncellendi.");
    } catch (e) {
      gosterSnackBar(context, "Hata: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final ImageProvider profilResmi =
        _webImage != null
            ? MemoryImage(_webImage!)
            : (_pickedImage != null && !kIsWeb
                ? MemoryImage(_webImage!)
                : const AssetImage('assets/placeholder1.png') as ImageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            GestureDetector(
              onTap: _resimSec,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.deepPurple.shade100,
                backgroundImage: profilResmi,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _isimController,
              decoration: const InputDecoration(labelText: "İsim"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _biyografiController,
              decoration: const InputDecoration(labelText: "Biyografi"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _profilGuncelle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade100,
                foregroundColor: Colors.deepPurple,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              child: const Text("Profili Güncelle"),
            ),
          ],
        ),
      ),
    );
  }
}
