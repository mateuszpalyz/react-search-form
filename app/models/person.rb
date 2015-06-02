class Person < ActiveRecord::Base
  paginates_per 10

  scope :search, ->(query) { where("email like ?", "%#{query}%") }
end
