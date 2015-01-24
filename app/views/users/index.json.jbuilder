json.key_format! camelize: :lower
json.users do
  json.array! @users, :id, :first_name, :last_name, :memo, :created_at
end