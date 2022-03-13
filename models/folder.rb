class Folder < Ohm::Model
  attribute :title
  attribute :description
  attribute :color
  attribute :created_at
  attribute :updated_at
  attribute :deleted_at
  unique :title
  collection :media, :Media
end
