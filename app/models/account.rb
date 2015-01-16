class Account < ActiveRecord::Base
  self.primary_key = 'ActID'
  self.table_name= 'Accounts'
end