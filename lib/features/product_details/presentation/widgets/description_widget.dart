import 'package:flutter/material.dart';
import 'package:task_orange_bay/core/constants/app_colors.dart';
import 'package:task_orange_bay/core/constants/app_strings.dart';
import 'package:task_orange_bay/core/constants/app_styles.dart';

class DescriptionWidget extends StatefulWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.description, style: AppStyles.font16BlackW400),
        const SizedBox(height: 8),
        AnimatedCrossFade(
          firstChild: Text(
            widget.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.font13Grey400,
          ),
          secondChild: Text(widget.description, style: AppStyles.font13Grey400),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() => _isExpanded = !_isExpanded);
          },
          child: Text(
            _isExpanded ? 'عرض أقل' : 'عرض المزيد',
            style: AppStyles.font13Grey400.copyWith(
              color: AppColors.primaryOrange,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
