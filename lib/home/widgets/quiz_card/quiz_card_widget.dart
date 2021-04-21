import 'package:flutter/material.dart';
import 'package:flutter_devquiz/core/app_colors.dart';
import 'package:flutter_devquiz/core/app_images.dart';
import 'package:flutter_devquiz/core/app_text_styles.dart';
import 'package:flutter_devquiz/shared/widgets/progress_indicator/progress_indicator.dart';

class QuizCardWidget extends StatelessWidget {
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
          Text("Gerenciamento de Estado", style: AppTextStyles.heading15, maxLines: 2,),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: Text("3 de 10", style: AppTextStyles.body11,)
              ),
              ProgressIndicatorWidget(value: 0.3)
            ],
          )
        ],
      ),
    );
  }
}
