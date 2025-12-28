import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../dashboard/data/models/doctor_slot.dart';

class SlotDateSelector extends StatefulWidget {
  final DoctorSlotModel? doctorSlotModel;
  final ValueChanged<int> onDateSelected;

  // Optional customization
  final double containerWidth;
  final double containerHeight;
  final double borderRadius;
  final Color selectedColor;
  final Color unselectedColor;
  final Color borderColor;
  final double dayFontSize;
  final double slotFontSize;
  final bool showScrollButtons;

  const SlotDateSelector({
    super.key,
    required this.doctorSlotModel,
    required this.onDateSelected,
    this.containerWidth = 185,
    this.containerHeight = 52,
    this.borderRadius = 8,
    this.selectedColor = const Color(0xFF745EDD),
    this.unselectedColor = Colors.white,
    this.borderColor = const Color(0xFF745EDD),
    this.dayFontSize = 14,
    this.slotFontSize = 12,
    this.showScrollButtons = true,
  });

  @override
  State<SlotDateSelector> createState() => _SlotDateSelectorState();
}

class _SlotDateSelectorState extends State<SlotDateSelector> {
  final ScrollController _scrollController = ScrollController();
  int selectedDateIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollRight() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final target = (_scrollController.offset + 200).clamp(0.0, maxScroll);
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollLeft() {
    final target = (_scrollController.offset - 200).clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );
    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.doctorSlotModel == null ||
        widget.doctorSlotModel!.dates.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: widget.containerHeight.h + 20,
      child: Row(
        children: [
          if (widget.showScrollButtons)
            GestureDetector(
              onTap: scrollLeft,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: widget.borderColor),
                  borderRadius: BorderRadius.circular(widget.borderRadius.r),
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: widget.borderColor,
                  size: 20.sp,
                ),
              ),
            ),
          if (widget.showScrollButtons) SizedBox(width: 12.w),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(widget.doctorSlotModel!.dates.length, (
                  index,
                ) {
                  final d = widget.doctorSlotModel!.dates[index];
                  final isSelected = index == selectedDateIndex;

                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDateIndex = index;
                        });
                        widget.onDateSelected(selectedDateIndex);
                      },
                      child: Container(
                        width: widget.containerWidth.w,
                        height: widget.containerHeight.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? widget.selectedColor
                              : widget.unselectedColor,
                          borderRadius: BorderRadius.circular(
                            widget.borderRadius.r,
                          ),
                          border: Border.all(color: widget.borderColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              d.day,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Color(0XFF303030),
                                fontWeight: FontWeight.normal,
                                fontSize: widget.dayFontSize.sp,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              d.slots,
                              style: TextStyle(
                                color: isSelected
                                    ? Color(0XFF9FE0FC)
                                    : Color(0XFF0400FF),
                                fontWeight: FontWeight.normal,
                                fontSize: widget.slotFontSize.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          if (widget.showScrollButtons) SizedBox(width: 12.w),
          if (widget.showScrollButtons)
            GestureDetector(
              onTap: scrollRight,
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  border: Border.all(color: widget.borderColor),
                  borderRadius: BorderRadius.circular(widget.borderRadius.r),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: widget.borderColor,
                  size: 20.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
