class RolePermission < ActiveRecord::Base
  self.primary_key = 'RoleID'
  self.table_name= 'RolePermissions'
  
end