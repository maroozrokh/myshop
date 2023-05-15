class Users {
	int? id;
	String? username;
	String? phone;
	String? image;
	String? address;
	int? role;

	Users({this.id, this.username, this.phone, this.image, this.role,this.address});

	@override
	String toString() {
		return 'Users(id: $id, username: $username, phone: $phone, image: $image, role: $role , address: $address)';
	}

	factory Users.fromJson(Map<String, dynamic> json) => Users(
				id: json['id']  ,
				username: json['username']  ,
				phone: json['phone']  ,
				image: json['image']  ,
				address: json['address']  ,
				role: json['role']  ,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'username': username,
				'phone': phone,
				'image': image,
				'role': role,
				'address': address,
			};

	Users copyWith({
		int? id,
		String? username,
		String? phone,
		String? image,
		String? address,
		int? role,
	}) {
		return Users(
			id: id ?? this.id,
			username: username ?? this.username,
			phone: phone ?? this.phone,
			image: image ?? this.image,
			address: address ?? this.address,
			role: role ?? this.role,
		);
	}
}
