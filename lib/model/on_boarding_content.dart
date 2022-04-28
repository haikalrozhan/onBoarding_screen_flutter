class OnBoardingContent {
  String? title;
  String? image;
  String? description;

  OnBoardingContent({this.title, this.image, this.description});

  static List<OnBoardingContent> generateOnBoardingContent() {
    return [
      OnBoardingContent(
        title: 'Buy Coconut',
        image: 'assets/images/coconut1.png',
        description: 'Lorem  and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ljjjjjjjjjjjjjjjjjj jjjjjjjjj'
      ),
      OnBoardingContent(
        title: 'Buy Coconut',
        image: 'assets/images/coconut2.png',
        description: 'The best coconut in the world'
      ),
      OnBoardingContent(
        title: 'Buy Coconut',
        image: 'assets/images/coconut3.png',
        description: 'The best coconut in the world'
      ),
    ];
  }
}