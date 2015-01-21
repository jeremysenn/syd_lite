class Denom < ActiveRecord::Base
  self.primary_key = 'dev_id'
  
  belongs_to :device, :foreign_key => 'dev_id'
end