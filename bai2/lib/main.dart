import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đề tài Khóa luận',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00796B)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProjectDetailScreen(),
    );
  }
}

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        title: const Text(
          'Chi Tiết Đề Tài Đồ Án',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF00796B), Color(0xFF004D40)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2F1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF00796B),
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.assignment,
                        size: 50,
                        color: Color(0xFF00796B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'XÂY DỰNG ỨNG DỤNG DI ĐỘNG QUẢN LÝ CHI TIÊU CÁ NHÂN SỬ DỤNG FLUTTER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004D40),
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFFE0E0E0), thickness: 1),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    icon: Icons.qr_code,
                    label: 'Mã đề tài',
                    value: 'DT-2026-CNTT-05',
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    icon: Icons.school,
                    label: 'Chuyên ngành',
                    value: 'Công nghệ Phần mềm',
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    icon: Icons.person,
                    label: 'Giảng viên hướng dẫn',
                    value: 'TS. Nguyễn Văn B',
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(
                    icon: Icons.group,
                    label: 'Số lượng sinh viên tối đa',
                    value: '2 sinh viên',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Yêu cầu đề tài:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004D40),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F9F9),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFECEFF1)),
                    ),
                    child: const Text(
                      '1. Có kiến thức cơ bản vững chắc về lập trình hướng đối tượng (OOP) và ngôn ngữ Dart.\n'
                      '2. Biết cách sử dụng framework Flutter để xây dựng giao diện người dùng (UI/UX) đáp ứng tốt trên Android/iOS.\n'
                      '3. Hiểu biết về quản lý trạng thái (State Management) như Provider, BLoC hoặc GetX.\n'
                      '4. Tích hợp được cơ sở dữ liệu SQLite hoặc Firebase để lưu trữ dữ liệu người dùng.\n'
                      '5. Tinh thần chủ động, báo cáo tiến độ đúng thời hạn quy định.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF37474F),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Row(
                          children: [
                            Icon(Icons.check_circle, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Đăng ký đề tài'),
                          ],
                        ),
                        content: const Text(
                          'Bạn đã đăng ký đề tài thành công! Vui lòng chờ phản hồi duyệt từ Giảng viên hướng dẫn.',
                        ),
                        actions: [
                          TextButton(
                            child: const Text(
                              'Đóng',
                              style: TextStyle(
                                color: Color(0xFF00796B),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  'Đăng Ký Đề Tài Ngay',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF00796B), size: 24),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF37474F),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
