import 'package:flutter/material.dart';
import 'package:flutter_devquiz/core/app_colors.dart';
import 'package:flutter_devquiz/home/home_controller.dart';
import 'package:flutter_devquiz/home/home_state.dart';
import 'package:flutter_devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_devquiz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_devquiz/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if(controller.state == HomeState.success) {
      return Scaffold(
          appBar: AppBarWidget(user: controller.user!,),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
            child: Column(
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: "Fácil"),
                    LevelButtonWidget(label: "Médio"),
                    LevelButtonWidget(label: "Difícil"),
                    LevelButtonWidget(label: "Perito"),
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: controller.quizzes!.map((e) =>
                        QuizCardWidget(
                            title: e.title,
                            percent: e.questionAnswered / e.questions.length,
                            completed: "${e.questionAnswered}/${e.questions
                                .length}")).toList(),
                  ),
                )
              ],
            ),
          )
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
