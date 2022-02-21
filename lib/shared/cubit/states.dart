abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class ChangeBottomNavigationBarItems extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccsessState extends NewsStates {}

class NewsGetBusinessErorrState extends NewsStates {
  final String erorr;

  NewsGetBusinessErorrState(this.erorr);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccsessState extends NewsStates {}

class NewsGetSportsErorrState extends NewsStates {
  final String erorr;

  NewsGetSportsErorrState(this.erorr);
}

class NewsGetScinenceLoadingState extends NewsStates {}

class NewsGetScinenceSuccsessState extends NewsStates {}

class NewsGetScinenceErorrState extends NewsStates {
  final String erorr;

  NewsGetScinenceErorrState(this.erorr);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccsessState extends NewsStates {}

class NewsGetSearchErorrState extends NewsStates {
  final String erorr;

  NewsGetSearchErorrState(this.erorr);
}

class NewsThemModeState extends NewsStates {}

class NewsselectbusinessItemState extends NewsStates {}

class NewsSetDesktopState extends NewsStates {}
