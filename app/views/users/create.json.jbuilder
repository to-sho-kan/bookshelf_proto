json.key_format! camelize: :lower
json.user do
  json.extract! @user, :id, :first_name, :last_name, :memo, :created_at
end
