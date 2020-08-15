class Search < ApplicationRecord
    
    validates :memo, presence: true
    
    serialize :age, JSON
    serialize :blood, JSON
    serialize :brother, JSON
    serialize :prefecture_id, JSON
    serialize :birthplace_id, JSON
    serialize :height, JSON
    
    MONEY = [[0,300],[300,500],[500,700]]
end
