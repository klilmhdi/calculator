part of 'num_calculate_cubit.dart';

abstract class NumCalculatorState {}

class NumCalculatorInitial extends NumCalculatorState {}

class AddNumbersState extends NumCalculatorState {}

class SubNumbersState extends NumCalculatorState {}

class MultiNumbersState extends NumCalculatorState {}

class DivNumbersState extends NumCalculatorState {}

class CalculationNumbersState extends NumCalculatorState {}

class DoesContainDecimalState extends NumCalculatorState {}

class SetZeroState extends NumCalculatorState {}

class ClickedState extends NumCalculatorState {}