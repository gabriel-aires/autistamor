class Tag < Ohm::Model
  attribute :name
  attribute :fixed
  attribute :hidden
  unique :name
  collection :assignments, :Assignment
end
