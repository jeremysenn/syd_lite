class BillCount < ActiveRecord::Base
  self.primary_key = 'host_start_count'
  
  belongs_to :device, :foreign_key => 'dev_id'
  
  #############################
  #     Instance Methods      #
  #############################
  
  def count
    host_start_count - host_cycle_count
  end
  
  def status_description
    case status
    when 0
      return 'OK' 
    when 1
      return 'Empty'
    when 2
      return 'Fatal'
    when 3
      return 'Not Used'
    when 4
      return 'Low'
    when 5
      return 'Testing'
    when 6
      return 'Unknown'
    else
      return 'Unknown'
    end
  end
  
  #############################
  #     Class Methods      #
  #############################
end