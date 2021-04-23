import 'package:flutter/material.dart';
import 'package:flutter_devquiz/core/app_images.dart';
import 'package:flutter_devquiz/home/home_repository.dart';
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

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
