class Card < ActiveRecord::Base
  self.primary_key = 'card_nbr'
  
  belongs_to :device, :foreign_key => 'dev_id'
end