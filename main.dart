import 'package:flutter/material.dart';

void main() => runApp(const ProgressCoachingApp());

const navy = Color(0xFF173B70);
const blue = Color(0xFF2867B2);
const pale = Color(0xFFF2F6FC);

class ProgressCoachingApp extends StatelessWidget {
  const ProgressCoachingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Progress Coaching Centre',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: blue),
        scaffoldBackgroundColor: pale,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const RolePage(),
    );
  }
}

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.school_rounded, size: 46, color: navy),
                ),
                const SizedBox(height: 18),
                const Text(
                  'PROGRESS\nCOACHING CENTRE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('শিক্ষা • শৃঙ্খলা • সাফল্য',
                    style: TextStyle(color: Colors.white70, fontSize: 15)),
                const SizedBox(height: 34),
                ...[
                  ('শিক্ষার্থী', Icons.menu_book_rounded),
                  ('শিক্ষক', Icons.person_pin_rounded),
                  ('অ্যাডমিন', Icons.admin_panel_settings_rounded),
                ].map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: navy,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomePage(role: item.$1),
                            ),
                          ),
                          icon: Icon(item.$2),
                          label: Text('প্রবেশ করুন — ${item.$1}'),
                        ),
                      ),
                    )),
                const SizedBox(height: 14),
                const Text('প্রাথমিক ডেমো সংস্করণ',
                    style: TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String role;
  const HomePage({super.key, required this.role});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  final pages = const [
    DashboardTab(),
    RoutineTab(),
    ResultsTab(),
    NoticesTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Coaching Centre',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Text(widget.role,
                  style: const TextStyle(fontSize: 12, color: Colors.white70)),
            ),
          ),
        ],
      ),
      body: pages[selected],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selected,
        onDestinationSelected: (i) => setState(() => selected = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'হোম'),
          NavigationDestination(icon: Icon(Icons.calendar_month), label: 'রুটিন'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'ফলাফল'),
          NavigationDestination(icon: Icon(Icons.campaign_outlined), label: 'নোটিশ'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'প্রোফাইল'),
        ],
      ),
    );
  }
}

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [navy, blue]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('স্বাগতম!',
                  style: TextStyle(color: Colors.white70, fontSize: 15)),
              SizedBox(height: 6),
              Text('Progress Coaching Centre',
                  style: TextStyle(color: Colors.white, fontSize: 22,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('তোমার শেখার যাত্রা শুরু হোক আজই।',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
        const SizedBox(height: 18),
        const Text('এক নজরে', style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold, color: navy)),
        const SizedBox(height: 12),
        const Row(children: [
          Expanded(child: StatCard(icon: Icons.groups, title: 'শিক্ষার্থী',
              value: '—')),
          SizedBox(width: 10),
          Expanded(child: StatCard(icon: Icons.co_present, title: 'শিক্ষক',
              value: '—')),
        ]),
        const SizedBox(height: 10),
        const Row(children: [
          Expanded(child: StatCard(icon: Icons.menu_book, title: 'ক্লাস',
              value: '৩–১২')),
          SizedBox(width: 10),
          Expanded(child: StatCard(icon: Icons.event_note, title: 'নোটিশ',
              value: '০১')),
        ]),
        const SizedBox(height: 20),
        const Text('দ্রুত সেবা', style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold, color: navy)),
        const SizedBox(height: 10),
        const QuickTile(icon: Icons.how_to_reg, title: 'ভর্তি ও রেজিস্ট্রেশন',
            subtitle: 'শিক্ষার্থী নিবন্ধন'),
        const QuickTile(icon: Icons.fact_check, title: 'উপস্থিতি',
            subtitle: 'ক্লাসের উপস্থিতির তথ্য'),
        const QuickTile(icon: Icons.payments_outlined, title: 'বেতন ও পেমেন্ট',
            subtitle: 'ফি সংক্রান্ত তথ্য'),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String title, value;
  const StatCard({super.key, required this.icon, required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: blue, size: 25),
        const SizedBox(height: 10),
        Text(value, style: const TextStyle(fontSize: 21,
            fontWeight: FontWeight.bold, color: navy)),
        Text(title, style: const TextStyle(color: Colors.black54)),
      ]),
    ),
  );
}

class QuickTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const QuickTile({super.key, required this.icon, required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    color: Colors.white,
    child: ListTile(
      leading: CircleAvatar(backgroundColor: const Color(0xFFE6EFFB),
          child: Icon(icon, color: blue)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('এই সুবিধাটি পরবর্তী সংস্করণে যুক্ত হবে।')),
      ),
    ),
  );
}

class RoutineTab extends StatelessWidget {
  const RoutineTab({super.key});
  @override
  Widget build(BuildContext context) => const InfoList(
    title: 'ক্লাস রুটিন',
    subtitle: 'এখানে শ্রেণি ও বিষয়ভিত্তিক রুটিন প্রকাশ করা যাবে।',
    icon: Icons.calendar_month,
    items: ['৩য়–৫ম শ্রেণি', '৬ষ্ঠ–৮ম শ্রেণি', '৯ম–১০ম শ্রেণি', 'একাদশ–দ্বাদশ শ্রেণি'],
  );
}

class ResultsTab extends StatelessWidget {
  const ResultsTab({super.key});
  @override
  Widget build(BuildContext context) => const InfoList(
    title: 'পরীক্ষার ফলাফল',
    subtitle: 'শিক্ষার্থীরা এখানে পরীক্ষার ফলাফল দেখতে পারবে।',
    icon: Icons.emoji_events_outlined,
    items: ['মাসিক পরীক্ষা', 'মডেল টেস্ট', 'সাময়িক পরীক্ষা', 'বার্ষিক পরীক্ষা'],
  );
}

class NoticesTab extends StatelessWidget {
  const NoticesTab({super.key});
  @override
  Widget build(BuildContext context) => const InfoList(
    title: 'নোটিশ বোর্ড',
    subtitle: 'কোচিং সেন্টারের গুরুত্বপূর্ণ ঘোষণা।',
    icon: Icons.campaign_outlined,
    items: ['ভর্তি কার্যক্রম ও ক্লাসের সময়সূচি জানতে অফিসে যোগাযোগ করুন।'],
  );
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) => const InfoList(
    title: 'প্রোফাইল',
    subtitle: 'ব্যবহারকারীর ব্যক্তিগত তথ্য ও অ্যাকাউন্ট সেটিংস।',
    icon: Icons.account_circle_outlined,
    items: ['নাম ও পরিচিতি', 'শ্রেণি / দায়িত্ব', 'যোগাযোগের তথ্য', 'লগআউট'],
  );
}

class InfoList extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final List<String> items;
  const InfoList({super.key, required this.title, required this.subtitle,
      required this.icon, required this.items});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(18),
    children: [
      Icon(icon, size: 52, color: blue),
      const SizedBox(height: 12),
      Text(title, textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold,
              color: navy)),
      const SizedBox(height: 8),
      Text(subtitle, textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.black54)),
      const SizedBox(height: 20),
      ...items.map((s) => Card(
        elevation: 0,
        color: Colors.white,
        child: ListTile(
          leading: const Icon(Icons.chevron_right, color: blue),
          title: Text(s),
        ),
      )),
    ],
  );
}
