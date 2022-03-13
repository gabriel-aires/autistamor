class Media < Ohm::Model
  attribute :title
  attribute :legend
  attribute :type
  attribute :content
  attribute :created_at
  attribute :updated_at
  attribute :deleted_at
  unique :title
  collection :attachments, :Attachment
  reference :folder, :Folder
  reference :user, :User
end
