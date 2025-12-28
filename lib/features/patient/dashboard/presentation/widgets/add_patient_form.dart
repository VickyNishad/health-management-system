import 'package:flutter/material.dart';

class AddPatientForm extends StatefulWidget {
  final String? initialName;
  final String? initialAge;
  final String? initialMobile;
  final double size;
  final Function(String name, String age, String mobile) onSubmit;

  const AddPatientForm({
    super.key,
    this.initialName,
    this.initialAge,
    this.initialMobile,
    this.size = 500,
    required this.onSubmit,
  });

  @override
  State<AddPatientForm> createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _ageCtrl = TextEditingController();
  final TextEditingController _mobileCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameCtrl.text = widget.initialName ?? "";
    _ageCtrl.text = widget.initialAge ?? "";
    _mobileCtrl.text = widget.initialMobile ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: widget.size, // ⭐ Increase dialog width
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.initialName == null ? "Add Patient" : "Edit Patient",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),

              TextField(
                controller: _ageCtrl,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 14),

              TextField(
                controller: _mobileCtrl,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_nameCtrl.text.trim().isEmpty ||
                            _ageCtrl.text.trim().isEmpty ||
                            _mobileCtrl.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fill all required fields'),
                            ),
                          );
                          return;
                        }

                        widget.onSubmit(
                          _nameCtrl.text.trim(),
                          _ageCtrl.text.trim(),
                          _mobileCtrl.text.trim(),
                        );

                        Navigator.pop(context);
                      },
                      child: Text(widget.initialName == null ? "Add" : "Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
