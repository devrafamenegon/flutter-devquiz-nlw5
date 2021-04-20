import 'package:flutter/material.dart';
import 'package:flutter_devquiz/core/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;

  //se o label for diferente de uma das 4 opções, o asset ja acusa erro
  LevelButtonWidget({Key? key, required this.label})
      : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)),
        super(key: key);

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil,
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio,
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil,
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito,
    }
  };

  //facilita a obtenção das cores
  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.notoSans(color: fontColor, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
