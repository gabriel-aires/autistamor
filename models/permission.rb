class Permission < Ohm::Model
  attribute :name
  unique :name
  reference :role, :Role
end
