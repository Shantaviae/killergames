enum ScreenType { Mobile, Tablet, Desktop, Watch }

enum StateType { Initial, Loaded }

extension ViewModelStateX on StateType {
  bool get isInitial => this == StateType.Initial;
  bool get isLoaded => this == StateType.Loaded;
}
