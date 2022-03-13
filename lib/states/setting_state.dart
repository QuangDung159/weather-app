import 'package:equatable/equatable.dart';

enum TempUnit { f, c }

class SettingState extends Equatable {
  final TempUnit tempUnit;
  const SettingState({required this.tempUnit}) : assert(tempUnit != null);

  @override
  List<Object?> get props => [tempUnit];
}
