class BillHist < ActiveRecord::Base
  self.primary_key = 'old_start'
  self.table_name= 'bill_hist'
end