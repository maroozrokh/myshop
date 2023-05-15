class ProductModel {
	int? id;
	String? name;
	int? price;
	int? discount;
	String? discription;
	List<dynamic>? tags;
	bool? isAvilable;
	int? totalCount;
	String? category;
	String? image;

	ProductModel({
		this.id, 
		this.name, 
		this.price, 
		this.discount, 
		this.discription, 
		this.tags, 
		this.isAvilable, 
		this.totalCount, 
		this.category, 
		this.image, 
	});

	@override
	String toString() {
		return 'ProductModel(id: $id, name: $name, price: $price, discount: $discount, discription: $discription, tags: $tags, isAvilable: $isAvilable, totalCount: $totalCount, category: $category)';
	}

	factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
				id: json['id'] as int?,
				name: json['name'] as String?,
				price: json['price'] as int?,
				discount: json['discount'] as int?,
				discription: json['discription'] as String?,
				tags: json['tags'] as List<dynamic>?,
				isAvilable: json['isAvilable'] as bool?,
				totalCount: json['totalCount'] as int?,
				category: json['category'] as String?,
				image: json['image'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'price': price,
				'discount': discount,
				'discription': discription,
				'tags': tags,
				'isAvilable': isAvilable,
				'totalCount': totalCount,
				'category': category,
				'image': image,
			};

	ProductModel copyWith({
		int? id,
		String? name,
		int? price,
		int? discount,
		String? discription,
		List<dynamic>? tags,
		bool? isAvilable,
		int? totalCount,
		String? category,
		String? image,
	}) {
		return ProductModel(
			id: id ?? this.id,
			name: name ?? this.name,
			price: price ?? this.price,
			discount: discount ?? this.discount,
			discription: discription ?? this.discription,
			tags: tags ?? this.tags,
			isAvilable: isAvilable ?? this.isAvilable,
			totalCount: totalCount ?? this.totalCount,
			category: category ?? this.category,
			image: image ?? this.image,
		);
	}
}
