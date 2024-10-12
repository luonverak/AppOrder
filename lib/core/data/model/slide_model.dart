class SlideModel {
  final int id;
  final String title;
  final String image;

  SlideModel({
    required this.id,
    required this.title,
    required this.image,
  });
}

final List<SlideModel> listSlide = [
  SlideModel(id: 1, title: "Slide", image: "asset/image/slide_1.jpg"),
  SlideModel(id: 2, title: "Slide", image: "asset/image/slide_2.png"),
  SlideModel(id: 3, title: "Slide", image: "asset/image/slide_3.jpg"),
];
