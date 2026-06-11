class CountryCityModel {

  final String country;
  final List<String> cities;

  CountryCityModel({
    required this.country,
    required this.cities,
  });

  Map<String, dynamic> toMap() {

    return {
      'country': country,
      'cities': cities,
    };
  }

  factory CountryCityModel.fromMap(
      Map<String, dynamic> map,
      ) {

    return CountryCityModel(

      country: map['country'] ?? '',

      cities:
      List<String>.from(
        map['cities'] ?? [],
      ),
    );
  }
}