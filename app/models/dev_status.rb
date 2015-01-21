class DevStatus < ActiveRecord::Base
  self.primary_key = 'dev_id'
  
  belongs_to :device, :foreign_key => 'dev_id'
  
  #############################
  #     Instance Methods      #
  #############################
  
  def status_description
    status_desc = StatusDesc.find_by_status(status)
    unless status_desc.blank?
      return status_desc.short_desc
    else
      return "N/A"
    end
  end
  
  #############################
  #     Class Methods      #
  #############################
end