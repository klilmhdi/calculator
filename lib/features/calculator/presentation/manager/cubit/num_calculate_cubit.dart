import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

part 'num_calculate_state.dart';

class NumCalculatorCubit extends Cubit<NumCalculatorState> {
  NumCalculatorCubit() : super(NumCalculatorInitial());

  static NumCalculatorCubit get(context) => BlocProvider.of(context);

  // Variables of The app
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 26.0;
  double resultFontSize = 48.0;

  // The Logic of Buttons Pressed
  BtnPressed(String buttonText) {
    switch (buttonText) {
      case "AC":
        {
          equation = "0";
          result = "0";
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          emit(SetZeroState());
        }
        break;
      case "⌫":
        {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equation = "0";
          }
        }
        break;
      case "=":
        {
          equationFontSize = 38.0;
          resultFontSize = 48.0;
          expression = equation;
          expression = expression.replaceAll('×', '*');
          expression = expression.replaceAll('÷', '/');
          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);
            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = "Error";
          }
        }
        break;
      default:
        {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
    }
    emit(ClickedState());
  }

  // Button Settings
  Widget BuildBtn(String buttonText, double buttonHeight, Color buttonColor, Color textColor, context) => Padding(
        padding: EdgeInsets.all(6.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
          decoration: BoxDecoration(color: buttonColor, borderRadius: BorderRadius.circular(40.0)),
          child: MaterialButton(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(20.0),
              onPressed: () => BtnPressed(buttonText),
              child: Text(buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 35.0,
                    fontWeight: FontWeight.w500,
                  ))),
        ),
      );
}
