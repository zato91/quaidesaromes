class Aroma < ActiveRecord::Base
  has_many :tasting, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end
