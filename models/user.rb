class User < Ohm::Model
  attribute :email
  attribute :name
  attribute :avatar
  unique :email
  reference :role, :Role
  collection :posts, :Post
  collection :comments, :Comment
  collection :donations, :Donation
end
