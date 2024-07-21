import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormSection extends StatelessWidget {
  const FormSection({
    super.key,
    required this.sectionTitle,
    required this.sectionBody,
  });
  final Widget sectionTitle;
  final Widget sectionBody;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: Container(
        width: 0.8.sw,
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black54,
            width: 0.1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: sectionTitle),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: sectionBody),
          ],
        ),
      ),
    );
  }
}
