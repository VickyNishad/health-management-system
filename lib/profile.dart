import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // --- STATE MANAGEMENT ---
  int currentStep = 1;
  final int totalSteps = 4;
  bool isSettingsMode = false;
  String activeSettingsPage = "";

  // --- FORM CONTROLLERS ---
  final nameController = TextEditingController();
  final specController = TextEditingController();
  final licenseController = TextEditingController();
  final addressController = TextEditingController();
  final hoursController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Re-build sidebar UI when name changes
    nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    specController.dispose();
    licenseController.dispose();
    addressController.dispose();
    hoursController.dispose();
    super.dispose();
  }

  // --- NAVIGATION LOGIC ---
  void navigateToStep(int step) {
    setState(() {
      isSettingsMode = false;
      currentStep = step;
    });
  }

  void openSettings(String pageName) {
    setState(() {
      isSettingsMode = true;
      activeSettingsPage = pageName;
    });
  }

  void _submitProfile() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 50),
        title: const Text("Profile Verified"),
        content: const Text(
          "All details have been saved. Your clinical profile is now live.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(c),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: const Color(0xFFF3F2EF),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Row(
              children: [
                if (isWeb) _buildSidebar(),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 800),
                        margin: const EdgeInsets.all(24),
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: isSettingsMode
                            ? _buildSettingsContent()
                            : _buildActiveForm(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- UI COMPONENTS: SIDEBAR ---
  Widget _buildSidebar() {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.grey.shade200)),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileCard(),
          const SizedBox(height: 32),
          _sectionTitle("PROFILE MANAGEMENT"),
          _menuItem(1, "Personal Info", Icons.person_outline, true),
          _menuItem(2, "Credentials", Icons.verified_user_outlined, true),
          _menuItem(3, "Clinic Details", Icons.business_outlined, true),
          _menuItem(4, "Review & Finalize", Icons.rate_review_outlined, true),
          const SizedBox(height: 32),
          _sectionTitle("SYSTEM"),
          _menuItem(0, "Account Settings", Icons.settings_outlined, false),
          _menuItem(0, "Security", Icons.lock_outline, false),
          const Spacer(),
          const Divider(),
          _menuItem(0, "Log Out", Icons.logout, false, color: Colors.red),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A66C2).withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF0A66C2),
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameController.text.isEmpty
                      ? "Dr. Guest"
                      : nameController.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  "Verified Doctor",
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- FORM CONTENT ---
  Widget _buildActiveForm() {
    switch (currentStep) {
      case 1:
        return _stepLayout(
          title: "Personal Info",
          subtitle: "Update your identity details.",
          children: [
            _inputLabel("Full Name"),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            _inputLabel("Specialization"),
            TextField(
              controller: specController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        );
      case 2:
        return _stepLayout(
          title: "Credentials",
          subtitle: "Manage your legal identifiers.",
          children: [
            _inputLabel("License Number"),
            TextField(
              controller: licenseController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
          ],
        );
      case 3:
        return _stepLayout(
          title: "Clinic Logistics",
          subtitle: "Address and availability.",
          children: [
            _inputLabel("Clinic Address"),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            _inputLabel("Consultation Hours"),
            TextField(
              controller: hoursController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "e.g. 9AM - 5PM",
              ),
            ),
          ],
        );
      case 4:
        return _stepLayout(
          title: "Complete Review",
          subtitle: "Verify all data before saving changes.",
          children: [
            _reviewCategory("Personal", [
              _reviewRow("Name", nameController.text, 1),
              _reviewRow("Specialty", specController.text, 1),
            ]),
            const SizedBox(height: 16),
            _reviewCategory("Professional", [
              _reviewRow("License", licenseController.text, 2),
            ]),
            const SizedBox(height: 16),
            _reviewCategory("Location", [
              _reviewRow("Address", addressController.text, 3),
              _reviewRow("Hours", hoursController.text, 3),
            ]),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  // --- REVIEW WIDGETS ---
  Widget _reviewCategory(String title, List<Widget> rows) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A66C2),
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          ...rows,
        ],
      ),
    );
  }

  Widget _reviewRow(String label, String value, int step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Expanded(
            child: Text(
              value.isEmpty ? "Not Provided" : value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          InkWell(
            onTap: () => navigateToStep(step),
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Color(0xFF0A66C2),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPERS ---
  Widget _menuItem(
    int step,
    String title,
    IconData icon,
    bool isStep, {
    Color? color,
  }) {
    bool active = isStep
        ? (currentStep == step && !isSettingsMode)
        : (activeSettingsPage == title && isSettingsMode);
    return ListTile(
      onTap: () => isStep ? navigateToStep(step) : openSettings(title),
      leading: Icon(
        icon,
        color: color ?? (active ? const Color(0xFF0A66C2) : Colors.black54),
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? (active ? const Color(0xFF0A66C2) : Colors.black87),
          fontSize: 14,
          fontWeight: active ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      tileColor: active
          ? const Color(0xFF0A66C2).withOpacity(0.08)
          : Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      dense: true,
    );
  }

  Widget _stepLayout({
    required String title,
    required String subtitle,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 32),
        ...children,
        const SizedBox(height: 40),
        Row(
          children: [
            if (currentStep > 1)
              OutlinedButton(
                onPressed: () => setState(() => currentStep--),
                child: const Text("Back"),
              ),
            const Spacer(),
            ElevatedButton(
              onPressed: currentStep == totalSteps
                  ? _submitProfile
                  : () => setState(() => currentStep++),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0A66C2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: Text(
                currentStep == totalSteps ? "Confirm & Sync" : "Continue",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingsContent() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        activeSettingsPage,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),
      const Text("Global settings page for the doctor's account."),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () => navigateToStep(1),
        child: const Text("Back to Form"),
      ),
    ],
  );

  Widget _buildHeader() => Container(
    padding: const EdgeInsets.all(16),
    color: Colors.white,
    child: Row(
      children: [
        const Icon(Icons.health_and_safety, color: Color(0xFF0A66C2), size: 30),
        const SizedBox(width: 10),
        const Text(
          "MD-Connect Portal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const Spacer(),
        SizedBox(
          width: 250,
          child: LinearProgressIndicator(
            value: currentStep / totalSteps,
            minHeight: 6,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );

  Widget _inputLabel(String t) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
  );
  Widget _sectionTitle(String t) => Padding(
    padding: const EdgeInsets.only(left: 16, bottom: 8),
    child: Text(
      t,
      style: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    ),
  );
}
