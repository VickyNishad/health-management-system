import 'package:flutter/material.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/app_download+banner.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/dark_hero_and_process_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/faq_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/featured_doctors_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/final_footer.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/recent_blogs_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/service_ticker.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/specialties_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/support_banner.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/testimonials_and_stats_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/why_book_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/hero_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/nav_bar.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/service_bar.dart';

class PatientLandingWeb extends StatelessWidget {
  const PatientLandingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        255,
        255,
        255,
      ), // Light blue background
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Navbar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            const ServicesBar(),
            SpecialtiesSection(),
            FeaturedDoctorsSection(),
            ServiceTicker(),
            WhyBookSection(),
            DarkHeroAndProcessSection(),
            TestimonialsAndStatsSection(),
            FAQSection(),
            AppDownloadBanner(),
            RecentBlogsSection(),
            SupportBanner(),
            FinalFooter(),
          ],
        ),
      ),
    );
  }
}
