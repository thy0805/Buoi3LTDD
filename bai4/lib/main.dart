import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thông Tin Nhóm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3F51B5)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const GroupInfoScreen(),
    );
  }
}

class Member {
  final String id;
  final String name;
  final String role;
  final String imageUrl;

  const Member({
    required this.id,
    required this.name,
    required this.role,
    required this.imageUrl,
  });
}

class GroupInfoScreen extends StatelessWidget {
  const GroupInfoScreen({super.key});

  final List<Member> _members = const [
    Member(
      id: '2001221001',
      name: 'Nguyễn Văn Chiến',
      role: 'Nhóm trưởng',
      imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
    ),
    Member(
      id: '2001221002',
      name: 'Lê Thị Thảo',
      role: 'Thành viên',
      imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    ),
    Member(
      id: '2001221003',
      name: 'Trần Minh Hoàng',
      role: 'Thành viên',
      imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF1),
      appBar: AppBar(
        title: const Text(
          'Thông Tin Nhóm Học Tập',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3F51B5), Color(0xFF1A237E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MÃ NHÓM: N-01',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Icon(Icons.group_work, color: Colors.white, size: 28),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Biệt Đội Flutter HUIT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Divider(color: Colors.white30, thickness: 1),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.people_alt, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Số lượng thành viên: 3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                'DANH SÁCH THÀNH VIÊN',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF455A64),
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _members.length,
              itemBuilder: (context, index) {
                final member = _members[index];
                final isLeader = member.role == 'Nhóm trưởng';
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    leading: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isLeader ? const Color(0xFFFFB300) : const Color(0xFF3F51B5),
                          width: 2.5,
                        ),
                        image: DecorationImage(
                          image: NetworkImage(member.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      member.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF263238),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'MSSV: ${member.id}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isLeader ? const Color(0xFFFFF8E1) : const Color(0xFFE8EAF6),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isLeader ? const Color(0xFFFFD54F) : const Color(0xFFC5CAE9),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isLeader) ...[
                            const Icon(Icons.star, color: Color(0xFFFFA000), size: 16),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            member.role,
                            style: TextStyle(
                              color: isLeader ? const Color(0xFFFF8F00) : const Color(0xFF3F51B5),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
