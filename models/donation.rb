class Donation < Ohm::Model
  attribute :ammount
  attribute :text
  attribute :currency
  attribute :created_at
  collection :responses, :Comment
  reference :post, :Post
  reference :user, :User
end
