class Item {
  const Item({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.details,
    required this.isEggs,
    required this.isNoodles,
    required this.isFastFood,
    required this.isIndividuval,
    required this.isCocacola,
    required this.isIfad,
    required this.isKazi,
    required this.category,
    required this.quantity,
    required this.isChips,
    required this.isExclusiveOffer,
    required this.isBestSelling,
    required this.isGroceries,
  });
  final bool isGroceries;
  final bool isBestSelling;
  final bool isExclusiveOffer;
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final String details;
  final bool isEggs;
  final bool isNoodles;
  final bool isFastFood;
  final bool isIndividuval;
  final bool isCocacola;
  final bool isIfad;
  final bool isKazi;
  final List<String> category;
  final String quantity;
  final bool isChips;
}
