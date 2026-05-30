import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giới Thiệu Ngành Học',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F4C81)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const IndustryIntroScreen(),
    );
  }
}

class IndustryIntroScreen extends StatelessWidget {
  const IndustryIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F4F8),
        appBar: AppBar(
          title: const Column(
            children: [
              Text(
                'Khoa Công Nghệ Thông Tin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
              Text(
                'Đại Học Công Thương TP.HCM',
                style: TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF0F4C81), Color(0xFF1D3557)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            tabs: [
              Tab(
                icon: Icon(Icons.code),
                text: 'Công Nghệ Thông Tin',
              ),
              Tab(
                icon: Icon(Icons.security),
                text: 'An Toàn Thông Tin',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MajorDetailTab(
              title: 'Ngành Công Nghệ Thông Tin',
              code: 'Mã ngành: 7480201',
              description: 'Ngành học cốt lõi đào tạo các chuyên gia có khả năng nghiên cứu, thiết kế, phát triển, vận hành và bảo trì hệ thống phần mềm, phần cứng, mạng máy tính và truyền thông.',
              icon: Icons.computer,
              themeColor: Color(0xFF0F4C81),
              specializations: [
                'Công nghệ Phần mềm (Software Engineering)',
                'Hệ thống Thông tin (Information Systems)',
                'Mạng máy tính & Truyền thông (Computer Networks)'
              ],
              careers: [
                'Lập trình viên phần mềm (Web, Mobile, Game Developer)',
                'Kỹ sư phân tích thiết kế hệ thống thông tin',
                'Quản trị hệ thống máy tính và mạng',
                'Chuyên viên thiết kế cơ sở dữ liệu'
              ],
            ),
            MajorDetailTab(
              title: 'Ngành An Toàn Thông Tin',
              code: 'Mã ngành: 7480202',
              description: 'Ngành học mũi nhọn đào tạo kỹ sư chuyên sâu về bảo vệ hệ thống máy tính, thông tin mạng, phòng chống các cuộc tấn công phá hoại, phân tích mã độc và bảo mật dữ liệu.',
              icon: Icons.shield,
              themeColor: Color(0xFFE63946),
              specializations: [
                'An ninh mạng (Network Security)',
                'An toàn hệ thống thông tin (System Security)',
                'Mật mã học ứng dụng (Applied Cryptography)'
              ],
              careers: [
                'Chuyên viên kiểm thử xâm nhập & đánh giá bảo mật',
                'Kỹ sư phân tích mã độc và ứng cứu sự cố an ninh mạng',
                'Chuyên gia phát triển phần mềm bảo mật',
                'Quản trị an toàn thông tin doanh nghiệp'
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MajorDetailTab extends StatelessWidget {
  final String title;
  final String code;
  final String description;
  final IconData icon;
  final Color themeColor;
  final List<String> specializations;
  final List<String> careers;

  const MajorDetailTab({
    super.key,
    required this.title,
    required this.code,
    required this.description,
    required this.icon,
    required this.themeColor,
    required this.specializations,
    required this.careers,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: themeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(icon, color: themeColor, size: 36),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: themeColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            code,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(color: Color(0xFFECEFF1)),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF455A64),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Chuyên Ngành Đào Tạo', themeColor),
          const SizedBox(height: 12),
          ...specializations.map((spec) => _buildCardItem(spec, themeColor, Icons.check_circle_outline)),
          const SizedBox(height: 24),
          _buildSectionHeader('Cơ Hội Việc Làm Sau Tốt Nghiệp', themeColor),
          const SizedBox(height: 12),
          ...careers.map((career) => _buildCardItem(career, themeColor, Icons.work_outline)),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }

  Widget _buildCardItem(String text, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF37474F),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
