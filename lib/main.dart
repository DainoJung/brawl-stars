import 'package:flutter/material.dart';

void main() {
  runApp(const MedicineReminderApp());
}

class MedicineReminderApp extends StatelessWidget {
  const MedicineReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '약 복용 관리',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3B81F5)),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 헤더: 사용자 인사말
              _buildHeader(),
              const SizedBox(height: 24),

              // 오늘의 약 리스트
              _buildTodayMedicineList(),
              const SizedBox(height: 24),

              // 다음 알림
              _buildNextAlarm(),
              const SizedBox(height: 24),

              // 빠른 기능
              _buildQuickActions(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '👋 안녕하세요, 김할머니님',
          style: TextStyle(
            color: Color(0xFF111726),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.33,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '오늘 복용해야 할 약이 2개 있습니다',
          style: TextStyle(
            color: Color(0xFF4A5462),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildTodayMedicineList() {
    return Column(
      children: [
        MedicineCard(
          emoji: '💊',
          title: '아침 약',
          time: '08:00',
          status: MedicineStatus.completed,
        ),
        const SizedBox(height: 16),
        MedicineCard(
          emoji: '💊',
          title: '저녁 약',
          time: '20:00',
          status: MedicineStatus.scheduled,
        ),
      ],
    );
  }

  Widget _buildNextAlarm() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF5FF),
        border: Border.all(
          color: const Color(0xFFBEDAFE),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF3B81F5),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: const Icon(
              Icons.alarm,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '다음 알림',
                style: TextStyle(
                  color: Color(0xFF1D3A8A),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.56,
                ),
              ),
              Text(
                '오늘 오후 8시',
                style: TextStyle(
                  color: Color(0xFF1C4ED8),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '빠른 기능',
          style: TextStyle(
            color: Color(0xFF111726),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        QuickActionCard(
          icon: Icons.camera_alt,
          title: '약 추가하기',
          subtitle: '사진으로 쉽게 등록',
          backgroundColor: const Color(0xFF5B89EE),
          onTap: () {
            // TODO: 약 추가 페이지로 이동
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('약 추가 기능 (준비 중)')),
            );
          },
        ),
        const SizedBox(height: 16),
        QuickActionCard(
          icon: Icons.chat_bubble_outline,
          title: '챗봇으로 질문하기',
          subtitle: '약에 대해 궁금한 점을 물어보세요',
          backgroundColor: const Color(0xFF37B843),
          onTap: () {
            // TODO: 챗봇 페이지로 이동
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('챗봇 기능 (준비 중)')),
            );
          },
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE4E7EB),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF3B81F5),
        unselectedItemColor: const Color(0xFF4A5462),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            label: '약 관리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: '알람',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '챗봇',
          ),
        ],
        onTap: (index) {
          // TODO: 네비게이션 처리
        },
      ),
    );
  }
}

// 약 복용 상태 Enum
enum MedicineStatus {
  completed,
  scheduled,
  missed,
}

// 약 카드 위젯
class MedicineCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String time;
  final MedicineStatus status;

  const MedicineCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final cardColors = _getCardColors(status);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColors['background'],
        border: Border.all(
          color: cardColors['border']!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF111726),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.56,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      color: Color(0xFF4A5462),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            _getStatusText(status),
            style: TextStyle(
              color: cardColors['text'],
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.43,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, Color> _getCardColors(MedicineStatus status) {
    switch (status) {
      case MedicineStatus.completed:
        return {
          'background': const Color(0xFFF0FDF4),
          'border': const Color(0xFFBAF6D0),
          'text': const Color(0xFF16A24A),
        };
      case MedicineStatus.scheduled:
        return {
          'background': const Color(0xFFEFF5FF),
          'border': const Color(0xFFBEDAFE),
          'text': const Color(0xFF2562EB),
        };
      case MedicineStatus.missed:
        return {
          'background': const Color(0xFFFEF2F2),
          'border': const Color(0xFFFECACA),
          'text': const Color(0xFFDC2626),
        };
    }
  }

  String _getStatusText(MedicineStatus status) {
    switch (status) {
      case MedicineStatus.completed:
        return '복용 완료';
      case MedicineStatus.scheduled:
        return '예정';
      case MedicineStatus.missed:
        return '누락';
    }
  }
}

// 빠른 실행 카드 위젯
class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final VoidCallback onTap;

  const QuickActionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.56,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.43,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
