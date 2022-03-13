class Role < Ohm::Model
  attribute :name
  unique :name
  collection :users, :User
  collection :permissions, :Permission
end
