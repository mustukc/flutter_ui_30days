class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Control Everything from One App",
    image: "assets/images/image1.png",
    desc: "Turn lights on, adjust temperature, or power devices — all from your phone.",
  ),
  OnboardingContents(
    title: "Automate Your Daily Routine",
    image: "assets/images/image2.png",
    desc: "Set schedules for lights, fans, and AC so your home works automatically for you.",
  ),
  OnboardingContents(
    title: "Stay Connected and Secure",
    image: "assets/images/image3.png",
    desc: "Monitor your smart home from anywhere and get instant alerts when something changes.",
  ),
];
