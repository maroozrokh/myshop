class TagsModel {
	int? id;
	String? tagName;
	bool? isDeletedTag;

	TagsModel({this.id, this.tagName, this.isDeletedTag});

	@override
	String toString() {
		return 'TagsModel(id: $id, tagName: $tagName, isDeletedTag: $isDeletedTag)';
	}

	factory TagsModel.fromJson(Map<String, dynamic> json) => TagsModel(
				id: json['id'] as int?,
				tagName: json['tagName'] as String?,
				isDeletedTag: json['isDeletedTag'] as bool?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'tagName': tagName,
				'isDeletedTag': isDeletedTag,
			};

	TagsModel copyWith({
		int? id,
		String? tagName,
		bool? isDeletedTag,
	}) {
		return TagsModel(
			id: id ?? this.id,
			tagName: tagName ?? this.tagName,
			isDeletedTag: isDeletedTag ?? this.isDeletedTag,
		);
	}
}
