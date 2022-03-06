class User < Ohm::Model
  attribute :email
  attribute :name  
  unique :email
end
