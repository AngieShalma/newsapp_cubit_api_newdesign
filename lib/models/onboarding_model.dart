class BoardingModel {
  final String image;
  final String title;
  final String description;
  BoardingModel(this.image,this.title,this.description);
}
List<BoardingModel> boardingItems =[
  BoardingModel("assets/images/onboarding_1.jpg", "", "  Welcome  "),
  BoardingModel("assets/images/onboarding_2.jpg", "Road news,personalized just for you!we", "we pick content suited to your preferences"),
  BoardingModel("assets/images/onboarding_3.jpg", "connect with your friends ", "to follow our newsapp "),

];
