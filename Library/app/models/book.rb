# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  author      :string           not null
#  category    :string
#  description :text
#  title       :string           not null
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Book < ApplicationRecord
    validates :title, :author, presence: true
    validate :year_not_in_future

    def year_not_in_future
        errors[:year] << "cannot be in the future" unless year < 2016
    end
end
