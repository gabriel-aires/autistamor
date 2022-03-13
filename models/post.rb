class Post < Ohm::Model
  attribute :title
  attribute :subtitle
  attribute :body
  attribute :created_at
  attribute :updated_at
  attribute :deleted_at
  unique :title
  collection :attachments, :Attachment
  collection :assignments, :Assignment
  collection :comments, :Comment
  collection :donations, :Donation
  reference :author, :User
end
