class RolePermission < ActiveRecord::Base
  self.primary_key = 'RoleID'
  self.table_name= 'RolePermissions'
  
  def ez_permission_description
    EzPermissionDesc.find_by_PermissionID(self.PermissionID)
  end
  
end