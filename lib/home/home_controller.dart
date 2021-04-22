import 'package:flutter/material.dart';
import 'package:flutter_devquiz/core/app_images.dart';
import 'package:flutter_devquiz/home/home_state.dart';
import 'package:flutter_devquiz/models/answer_model.dart';
import 'package:flutter_devquiz/models/question_model.dart';
import 'package:flutter_devquiz/models/quiz_model.dart';
import 'package:flutter_devquiz/models/user_model.dart';
import 'package:flutter/foundation.dart';


class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = UserModel(name: "Rafael Menegon", photoUrl: "https://avatars.githubusercontent.com/u/65569815?v=4");
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    quizzes = [
      QuizModel(
          title: "NLW 5 - Flutter",
          image: AppImages.blocks,
          questionAnswered: 2,
          level: Level.facil,
          questions: [
            QuestionModel(title: "Está curtindo Flutter?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Está legal"),
              AnswerModel(title: "Está bacana"),
              AnswerModel(title: "Está supimpa", isRight: true),
            ],
            ),
            QuestionModel(title: "Está curtindo Flutter?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Está legal"),
              AnswerModel(title: "Está bacana"),
              AnswerModel(title: "Está supimpa", isRight: true),
            ],
            ),
            QuestionModel(title: "Está curtindo Flutter?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Está legal"),
              AnswerModel(title: "Está bacana"),
              AnswerModel(title: "Está supimpa", isRight: true),
            ],
            ),
          ],
      )
    ];
    state = HomeState.success;
  }
}