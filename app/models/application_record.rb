class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  @games = Game.all
end
