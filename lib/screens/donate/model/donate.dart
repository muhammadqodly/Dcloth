class DonateModel {
  final int id;
  final String phone;
  final String weight;
  final String address;

  DonateModel(
      {required this.id,
      required this.phone,
      required this.weight,
      required this.address});

  factory DonateModel.fromEntity(dynamic movie) => DonateModel(
        id: movie.id,
        phone: movie.title,
        weight: movie.posterPath,
        address: movie.address,
      );

  factory DonateModel.fromMap(Map<String, dynamic> map) => DonateModel(
        id: map['id'],
        phone: map['phone'],
        weight: map['Weight'],
        address: map['address'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'phone': phone,
        'Weight': weight,
        'address': address,
      };
}
