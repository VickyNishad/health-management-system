import 'package:flutter/material.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/AppDownloadBanner.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/DarkHeroAndProcessSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/FAQSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/FeaturedDoctorsSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/FinalFooter.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/RecentBlogsSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/ServiceTicker.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/SpecialtiesSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/SupportBanner.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/TestimonialsAndStatsSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/WhyBookSection.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/hero_section.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/nav_bar.dart';
import 'package:medicque_app/features/patient/landing/presentation/widgets/service_bar.dart';

class PatientLandingWeb extends StatelessWidget {
  const PatientLandingWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF), // Light blue background
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



// FadeOnScroll(child: const HeroSection()),
//             FadeOnScroll(child: const ServicesBar()),
//             FadeOnScroll(child: SpecialtiesSection()),
//             FadeOnScroll(child: FeaturedDoctorsSection()),
//             FadeOnScroll(child: ServiceTicker()),
//             FadeOnScroll(child: WhyBookSection()),
//             FadeOnScroll(child: DarkHeroAndProcessSection()),
//             FadeOnScroll(child: TestimonialsAndStatsSection()),
//             FadeOnScroll(child: FAQSection()),
//             FadeOnScroll(child: AppDownloadBanner()),
//             FadeOnScroll(child: RecentBlogsSection()),
//             FadeOnScroll(child: SupportBanner()),
//             FadeOnScroll(child: FinalFooter()),