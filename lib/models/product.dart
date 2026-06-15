class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // JSON mantığı: Gelen sahte API verisini Dart nesnesine (Product) çevirir [cite: 38, 39]
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
    );
  }
}

// API'den geliyormuş gibi davranacak simülasyon verimiz [cite: 60, 70]
final List<Map<String, dynamic>> dummyJsonData = [
  {
    "id": "1",
    "name": "HomePod Mini",
    "description": "The HomePod mini is jam-packed with innovation...",
    "price": 99.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/homepod-mini-select-orange-202110?wid=940&hei=1112&fmt=png-alpha&.v=1632925511000"
  },
  {
    "id": "2",
    "name": "AirPods Pro",
    "description": "Active Noise Cancellation for immersive sound.",
    "price": 249.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/MQD83?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1660803972361"
  },
  {
    "id": "3",
    "name": "MacBook Pro 14\"",
    "description": "Supercharged by M2 Pro or M2 Max.",
    "price": 1999.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/mbp14-spacegray-select-202301?wid=904&hei=840&fmt=jpeg&qlt=90&.v=1671304673229"
  },
  {
    "id": "4",
    "name": "iPad Air",
    "description": "Light. Bright. Full of might.",
    "price": 599.0,
    "imageUrl": "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/ipad-air-storage-select-202207-blue?wid=1080&hei=1140&fmt=png-alpha&.v=1654898144665"
  }
];

// Bu JSON verisini fromJson kullanarak Product nesnelerine dönüştürüp kullanılabilir bir listede tutuyoruz [cite: 39]
final List<Product> productList = dummyJsonData.map((json) => Product.fromJson(json)).toList();
// Sepete eklenen ürünleri tutacağımız global liste
final List<Product> cartItems = [];