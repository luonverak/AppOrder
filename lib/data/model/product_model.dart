class ProductModel {
  final int id;
  final String name;
  final String discount;
  final double price;
  final double rate;
  final String image;

  ProductModel(
      {required this.id,
      required this.name,
      required this.discount,
      required this.price,
      required this.rate,
      required this.image});

  @override
  String toString() {
    return "id:$id \t name: $name";
  }
}

final List<ProductModel> listProduct = [
  ProductModel(
    id: 1,
    name: "Peri peri chicken, Mozambique",
    discount: "Off 10%",
    price: 10,
    rate: 3.5,
    image:
        "https://loveincorporated.blob.core.windows.net/contentimages/gallery/1c615f9c-7989-4580-b581-9a60caf3ed57-bestdishes_periperi.jpg",
  ),
  ProductModel(
    id: 2,
    name: "Sauerbraten, Germany",
    discount: "Off 5%",
    price: 4,
    rate: 4.5,
    image:
        "https://loveincorporated.blob.core.windows.net/contentimages/gallery/bf4334ad-bda0-405c-a6e9-60fc3e96faec-26-sauerbraten.jpg",
  ),
  ProductModel(
    id: 3,
    name: "Haggis, Scotland",
    discount: "Off 15%",
    price: 5,
    rate: 4.5,
    image:
        "https://loveincorporated.blob.core.windows.net/contentimages/gallery/32e4c719-58ae-482e-b504-9ea618f21272-32-haggis.jpg",
  ),
  ProductModel(
    id: 4,
    name: "Fish and chips, UK",
    discount: "Off 25%",
    price: 14,
    rate: 3.5,
    image:
        "https://loveincorporated.blob.core.windows.net/contentimages/gallery/a629ec0b-e938-453c-9bd7-333c1605b274-37-fish-and-chips.jpg",
  ),
];
