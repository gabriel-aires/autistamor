class Comment < Ohm::Model
  attribute :text
  attribute :created_at
  attribute :deleted_at
  collection :responses, :Comment
  reference :post, :Post
  reference :origin, :Comment
  reference :user, :User
end
