class Cat < ApplicationRecord
    COAT_COLORS = %w(black calico tabby)
    
    validates :coat_color, :description, :name, :skill, presence: true
    validates :coat_color, inclusion: COAT_COLORS

    has_many :toys
end