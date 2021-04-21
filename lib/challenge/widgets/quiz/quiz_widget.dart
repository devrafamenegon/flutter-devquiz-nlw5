import 'package:flutter/material.dart';
import 'package:flutter_devquiz/challenge/widgets/Answer/answer_widget.dart';
import 'package:flutter_devquiz/core/app_text_styles.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(title, style: AppTextStyles.heading),
          SizedBox(height: 24),
          AnswerWidget(title: "Kit de desenvolvimento de interface de usuário"),
          AnswerWidget(title: "Possibilita a criação de aplicativos compilados não nativamente", isRight: true, isSelected: true),
          AnswerWidget(title: "Acho que é uma marca de café do Himalaia"),
          AnswerWidget(title: "Possibilita a criação de desktops que são muito incríveis"),
        ],
      ),
    );
  }
}
