class User < Ohm::Model
  attribute :email
  attribute :name
  attribute :secret
  attribute :avatar
  unique :email
  unique :name
  index :email
  reference :role, :Role
  collection :posts, :Post
  collection :comments, :Comment
  collection :donations, :Donation
end
