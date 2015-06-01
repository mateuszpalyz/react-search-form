class Person < ActiveRecord::Base
  scope :search, ->(query) { where("email like ?", "%#{query}%") }
end
