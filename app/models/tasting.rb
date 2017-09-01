class Tasting < ActiveRecord::Base
  belongs_to :wine
  has_many :tasting_aromas, dependent: :destroy

  accepts_nested_attributes_for :tasting_aromas, allow_destroy: true
  # validates :color, presence: true
  # validates :sweetness, presence: true
  # validates :acidity, presence: true
  # validates :tannins, presence: true
  # validates :body, presence: true
  # validates :length, presence: true
end
