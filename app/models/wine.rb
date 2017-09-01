class Wine < ActiveRecord::Base
  has_many :games, dependent: :destroy
  has_many :game_suspects, dependent: :destroy
  has_many :tastings, dependent: :destroy
  has_many :tasting_aromas, through: :tastings
  # has_many :question_games, -> { order(position: :asc) }, dependent: :destroy
  has_attachment :photo

  accepts_nested_attributes_for :tastings, allow_destroy: true

  include PgSearch
  pg_search_scope :search_by_wine_description, against: [ :estate, :cuvee, :label, :region, :country, :color ]

end
