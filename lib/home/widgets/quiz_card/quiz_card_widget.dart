import 'package:flutter/material.dart';
import 'package:flutter_devquiz/core/app_colors.dart';
import 'package:flutter_devquiz/core/app_images.dart';
import 'package:flutter_devquiz/core/app_text_styles.dart';
import 'package:flutter_devquiz/shared/widgets/progress_indicator/progress_indicator.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 18),
          Text(title, style: AppTextStyles.heading15, maxLines: 2,),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Text(completed, style: AppTextStyles.body11,)
              ),
              Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(value: percent)
              ),
            ],
          )
        ],
      ),
    );
  }
}
