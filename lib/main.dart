import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AlgerianSportsApp());
}

class AlgerianSportsApp extends StatelessWidget {
  const AlgerianSportsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مرصد الرياضة الجزائرية',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const NewsHomeScreen(),
    );
  }
}

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مرصد الرياضة الجزائرية 🇩🇿',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green[800],
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // الاستماع الفوري للبيانات من جدول sports_news في Firebase
        stream: FirebaseFirestore.instance.collection('sports_news').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('حدث خطأ في جلب البيانات: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'لا توجد أخبار حالياً، سيتم تحديث النتائج قريباً.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          final newsDocs = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(12.0),
            itemCount: newsDocs.length,
            itemBuilder: (context, index) {
              var newsData = newsDocs[index].data() as Map<String, dynamic>;
              String title = newsData['title'] ?? 'خبر رياضي جديد';
              String time = newsData['time'] ?? 'الآن';

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.sports_soccer, color: Colors.white),
                  ),
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
