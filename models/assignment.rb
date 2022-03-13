class Assignment < Ohm::Model
  collection :posts, :Post
  collection :tags, :Tag
end
