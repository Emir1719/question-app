enum QuestionCategory {
  any("any", "Any"),
  generalKnowledge("9", "General Knowledge"),
  entertainmentBooks("10", "Entertainment: Books"),
  entertainmentFilm("11", "Entertainment: Film"),
  entertainmentMusic("12", "Entertainment: Music"),
  entertainmentMusicalsTheatres("13", "Entertainment: Musicals Theatres"),
  entertainmentTelevision("14", "Entertainment: Television"),
  entertainmentVideoGames("15", "Entertainment: Video Games"),
  entertainmentBoardGames("16", "Entertainment: Board Games"),
  scienceNature("17", "Science & Nature"),
  scienceComputers("18", "Science: Computers"),
  scienceMathematics("19", "Science: Mathematics"),
  mythology("20", "Mythology"),
  sports("21", "Sports"),
  geography("22", "Geography"),
  history("23", "History"),
  politics("24", "Politics"),
  art("25", "Art"),
  celebrities("26", "Celebrities"),
  animals("27", "Animals"),
  vehicles("28", "Vehicles"),
  entertainmentComics("29", "Entertainment: Comics"),
  scienceGadgets("30", "Science: Gadgets"),
  entertainmentJapaneseAnimeManga("31", "Entertainment: Japanese Anime Manga"),
  entertainmentCartoonAnimations("32", "Entertainment: Cartoon Animations");

  final String value;
  final String longName;

  const QuestionCategory(this.value, this.longName);

  String toJson() => value;
  static QuestionCategory fromJson(String json) => values.firstWhere((element) => element.longName == json);
}
