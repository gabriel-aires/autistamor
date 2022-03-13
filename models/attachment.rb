class Attachment < Ohm::Model
  collection :media, :Media
  collection :posts, :Post
end
