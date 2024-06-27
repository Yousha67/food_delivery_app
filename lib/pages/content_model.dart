class onboardingcontent{

  String image;
  String title;
  String description;

  onboardingcontent({required this.image,required this.title,required this.description});




}
List<onboardingcontent>contents=[
  onboardingcontent(image: "images/screen1.png", title: "Select from our\n Best Menu", description:"Pick your food from our menu\n More than 35 times"),
  onboardingcontent(image: "images/screen2.png", title: "Easy and Online Payment ", description: "You can pay cash on delivery and\n  Card ayment is vailable "),
  onboardingcontent(image: "images/screen3.png", title: "Quick delivery at your doorstep", description: "Deliver your food at your\n DoorSteps"),
];