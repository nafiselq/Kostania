class SpaceNew {
  final int? id;
  final String? name;
  final String? city;
  final String? country;
  final int? price;
  final String? imageUrl;
  final int? rating;
  final String? address;
  final String? phone;
  final String? mapUrl;
  final List<String>? photos;
  final int? numberOfKitchens;
  final int? numberOfBedrooms;
  final int? numberOfCupboards;

  SpaceNew({
    this.id,
    this.name,
    this.city,
    this.country,
    this.price,
    this.imageUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchens,
    this.numberOfBedrooms,
    this.numberOfCupboards,
  });

  SpaceNew.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        city = json['city'] as String?,
        country = json['country'] as String?,
        price = json['price'] as int?,
        imageUrl = json['image_url'] as String?,
        rating = json['rating'] as int?,
        address = json['address'] as String?,
        phone = json['phone'] as String?,
        mapUrl = json['map_url'] as String?,
        photos =
            (json['photos'] as List?)?.map((dynamic e) => e as String).toList(),
        numberOfKitchens = json['number_of_kitchens'] as int?,
        numberOfBedrooms = json['number_of_bedrooms'] as int?,
        numberOfCupboards = json['number_of_cupboards'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'country': country,
        'price': price,
        'image_url': imageUrl,
        'rating': rating,
        'address': address,
        'phone': phone,
        'map_url': mapUrl,
        'photos': photos,
        'number_of_kitchens': numberOfKitchens,
        'number_of_bedrooms': numberOfBedrooms,
        'number_of_cupboards': numberOfCupboards
      };
}
