// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:glassmorphism_ui/glassmorphism_ui.dart';
//
// import '../manager/calculate_bloc.dart';
// import '../widgets/display.dart';
// import '../widgets/keyboard.dart';
//
//
// class CalculatorScreen extends StatefulWidget {
//
//   @override
//   State<CalculatorScreen> createState() => _CalculatorScreenState();
// }
//
// class _CalculatorScreenState extends State<CalculatorScreen> {
//   _onPressed(String command) {
//     setState(() {
//       context.read<CalculatorBloc>().add(CalculatorEvent(command: command));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: new BoxDecoration(
//             image: new DecorationImage(
//               image: new AssetImage("assets/images/bg.png"),
//               fit: BoxFit.fill,
//             )),
//         child: GlassContainer(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           child: Column(
//             children: [
//               BlocBuilder<CalculatorBloc, CalculatorState>(
//                   builder: (__, state) {
//                     return Display(state.value);
//                   }),
//               Keyboard(_onPressed),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/manage/theme_cubit.dart';
import '../manager/cubit/num_calculate_cubit.dart';

class NumCalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumCalculatorCubit(),
      child: BlocConsumer<NumCalculatorCubit, NumCalculatorState>(
        listener: (context, state) {},
        builder: (context, state) {
          NumCalculatorCubit cubit = NumCalculatorCubit.get(context);
          ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: false);
          IconData iconLight = Icons.wb_sunny;
          IconData iconDark = Icons.nights_stay;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: [
                IconButton(
                  onPressed: () => theme.changeTheme(),
                  icon: Icon(theme.isDark ? iconDark : iconLight),
                ),
              ],
            ),
            body: SafeArea(
              child: Container(
                child: Column(
                  children: [
                    // Input settings "Equation"
                    Expanded(
                      flex: 1,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child: Text(
                                cubit.equation,
                                style: TextStyle(fontSize: 26, color: Colors.white),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                              child: Text(
                                cubit.result,
                                style: TextStyle(fontSize: cubit.resultFontSize, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Output settings "Result"
                    // SizedBox(
                    //   height: 35.0,
                    // ),
                    // Buttons
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .75,
                            child: Table(
                              children: [
                                TableRow(children: [
                                  cubit.BuildBtn("AC", 1, Colors.grey, Colors.black, context),
                                  cubit.BuildBtn("⌫", 1, Colors.white, Colors.black, context),
                                  cubit.BuildBtn("÷", 1, Colors.amber[700]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("7", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("8", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("9", 1, Colors.grey[850]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("4", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("5", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("6", 1, Colors.grey[850]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("1", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("2", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("3", 1, Colors.grey[850]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("0", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn("00", 1, Colors.grey[850]!, Colors.white, context),
                                  cubit.BuildBtn(".", 1, Colors.grey[850]!, Colors.white, context),
                                ]),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Table(
                              children: [
                                TableRow(children: [
                                  cubit.BuildBtn("×", 1, Colors.amber[700]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("-", 1, Colors.amber[700]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("+", 1, Colors.amber[700]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("%", 1, Colors.amber[700]!, Colors.white, context),
                                ]),
                                TableRow(children: [
                                  cubit.BuildBtn("=", 1, Colors.amber[700]!, Colors.white, context),
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
