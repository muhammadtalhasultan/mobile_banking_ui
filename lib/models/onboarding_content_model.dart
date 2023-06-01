class OnbordingContent {
 final String image;
 final String title;
 final String discription;

  OnbordingContent({required this.image,required this.title,required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: 'Safe and easy',
    image: 'assets/images/onboarding_1.png',
    discription: "The safest and easiest way to save and save money"
  ),
  OnbordingContent(
    title: 'Integrated process',
    image: 'assets/images/onboarding_2.png',
    discription: "Say goodbye to slow and inconvenient processes"
  ),
  OnbordingContent(
    title: 'With just one app',
    image: 'assets/images/onboarding_3.png',
    discription: "All your needs are integrated with just one application"
  ),
];
