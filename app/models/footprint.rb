class Footprint < ApplicationRecord
    
  belongs_to :visiter, class_name: "User"
  belongs_to :visited, class_name: "User"
  validates :visiter_id, presence: true
  validates :visited_id, presence: true    
    
end
