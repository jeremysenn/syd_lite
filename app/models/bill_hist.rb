class BillHist < ActiveRecord::Base
  self.primary_key = 'old_start'
  self.table_name= 'bill_hist'
  
  belongs_to :device, :foreign_key => 'dev_id'
end