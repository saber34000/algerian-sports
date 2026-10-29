import 'package:flutter/material.dart';

// --- 1. الألوان والهوية البصرية ---
class AppColors {
  static const Color primaryGreen = Color(0xFF006233); // أخضر العلم الجزائري
  static const Color accentRed = Color(0xFFD52B1E);    // أحمر حماسي
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121418); // خلفية داكنة احترافية
  static const Color cardBackground = Color(0xFF1E222B); // لون البطاقات
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color liveRed = Color(0xFFFF3B30);      // لون البث الحي
}

void main() {
  runApp(const DZSportObservatoryApp());
}

class DZSportObservatoryApp extends StatelessWidget {
  const DZSportObservatoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مرصد الرياضة الجزائرية',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'DZ'),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        primaryColor: AppColors.primaryGreen,
        fontFamily: 'Cairo',
      ),
      home: const MainHomeScreen(),
    );
  }
}

// --- 2. الشاشة الرئيسية والتبويبات ---
class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  // ترتيب الأقسام حسب رغبتك: المنتخب -> المشاركات الخارجية -> البطولة والفرق الجماهيرية
  final List<Widget> _screens = [
    const NationalTeamScreen(),
    const ContinentalScreen(),
    const LocalLeagueScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('🇩🇿', style: TextStyle(fontSize: 22)),
            SizedBox(width: 😎,
            Text(
              'مرصد الرياضة الجزائرية',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.pureWhite,
              ),
            ),
          ],
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: AppColors.cardBackground,
        selectedItemColor: AppColors.accentRed,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shield),
            label: 'المنتخب الوطني',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'المشاركات الخارجية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'البطولة الجماهيرية',
          ),
        ],
      ),
    );
  }
}

// --- 3. قسم المنتخب الوطني (الخضر) ---
class NationalTeamScreen extends StatelessWidget {
  const NationalTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // بطاقة ترويجية للمنتخب
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryGreen, AppColors.backgroundDark],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('وحدة، عزيمة، وطموح', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              SizedBox(height: 😎,
              Text('محاربوه الصحراء في قلب الحدث', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.pureWhite)),
              SizedBox(height: 12),
              Text('تابع أخبار المعسكرات، القائمة المستدعاة، وتصفيات المونديال لحظة بلحظة.', style: TextStyle(color: AppColors.textPrimary, fontSize: 13)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('⭐ آخر مستجدات الخضر', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _buildNewsItem('بيتكوفيتش يعلن عن قائمة اللاعبين المعنيين بتربص المنتخب الوطني القادم.', 'منذ ساعة'),
        _buildNewsItem('محرز وعمورة يقودان أنديتهم لتألق لافت في الملاعب الخارجية.', 'منذ 3 ساعات'),
      ],
    );
  }

  Widget _buildNewsItem(String title, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: AppColors.accentRed),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- 4. قسم المشاركات الخارجية للأندية ---
class ContinentalScreen extends StatelessWidget {
  const ContinentalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text('🌍 ممثلو الجزائر قارياً (أبطال إفريقيا والكونفدرالية)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildMatchCard('رابطة أبطال إفريقيا', 'مولودية الجزائر (MCA)', '1 - 0', 'مازيمبي الكونغولي', 'انتهت'),
        const SizedBox(height: 12),
        _buildMatchCard('كأس الكونفدرالية الإفريقية', 'اتحاد الجزائر (USMA)', '2 - 1', 'الأسود التونسي', 'مباشر 85\''),
        const SizedBox(height: 12),
        _buildMatchCard('رابطة أبطال إفريقيا', 'شباب بلوزداد (CRB)', '0 - 0', 'أورلاندو بايرتس', 'قريبا'),
      ],
    );
  }

  Widget _buildMatchCard(String competition, String team1, String score, String team2, String status) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(competition, style: const TextStyle(color: AppColors.accentRed, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(team1, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(score, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.pureWhite)),
              ),
              Expanded(child: Text(team2, textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))),
            ],
          ),
          const SizedBox(height: 😎,
          Text(status, style: TextStyle(color: status.contains('مباشر') ? AppColors.liveRed : AppColors.textSecondary, fontSize: 11)),
        ],
      ),
    );
  }
}

// --- 5. قسم البطولة الوطنية والأندية الجماهيرية ---
class LocalLeagueScreen extends StatelessWidget {
  const LocalLeagueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text('🏟️ نبض المدرجات والبطولة المحترفة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        // جدول مصغر للأندية الجماهيرية الكبرى
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildRow('المرتبة', 'النادي الجماهيري', 'النقاط', isHeader: true),
              _buildRow('1', 'مولودية الجزائر (الشناوة - MCA)', '48'),
              _buildRow('2', 'شباب بلوزداد (العقيبية - CRB)', '42'),
              _buildRow('3', 'اتحاد الجزائر (سوسطارة - USMA)', '39'),
              _buildRow('4', 'شبيبة القبيلة (الكناري - JSK)', '37'),
              _buildRow('5', 'وفاق سطيف (النسر السطايفي - ESS)', '35'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow(String rank, String team, String points, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 40, child: Text(rank, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal, color: isHeader ? AppColors.accentRed : AppColors.textPrimary))),
          Expanded(flex: 3, child: Text(team, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal, fontSize: 13))),
          SizedBox(width: 50, child: Text(points, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: isHeader ? AppColors.textPrimary : AppColors.primaryGreen))),
        ],
      ),
    );
  }
}
