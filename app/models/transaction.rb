class Transaction < ActiveRecord::Base
  self.primary_key = 'tranID'
  
  belongs_to :device, :foreign_key => 'dev_id'
  
  #############################
  #     Instance Methods      #
  #############################
  
  def error_code_description
    error_desc = ErrorDesc.find_by_error_code(error_code)
    unless error_desc.blank?
      return error_desc.short_desc
    else
      return "N/A"
    end
  end
  
  def error_code_long_description
    error_desc = ErrorDesc.find_by_error_code(error_code)
    unless error_desc.blank?
      return error_desc.long_desc
    else
      return "Not Applicable"
    end
  end
  
  def status_description
    tran_status_desc = TranStatusDesc.find_by_tran_status(tran_status)
    unless tran_status_desc.blank?
      return tran_status_desc.short_desc
    else
      return "N/A"
    end
  end
  
  def status_long_description
    tran_status_desc = TranStatusDesc.find_by_tran_status(tran_status)
    unless tran_status_desc.blank?
      return tran_status_desc.long_desc
    else
      return "Not Applicable"
    end
  end
  
  def images
    images = Image.get(:ransack_search, :q => {tranid_eq: tranID, receipt_nbr_eq: receipt_nbr, m: 'or'})
    unless images.blank?
      return images
    else
      return nil
    end
  end
  
  #############################
  #     Class Methods      #
  #############################
  
end