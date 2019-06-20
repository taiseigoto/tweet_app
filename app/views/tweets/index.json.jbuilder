json.array! @user do |user|
	json.name user.name
	json.avatar url_for user.avatar
	json.id user.id
end