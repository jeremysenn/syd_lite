### USED TO CONNECT TO SYD API IMAGE RESOURCE ###
class Image < ActiveResource::Base
  self.site = "http://#{ENV['MIDDLE_TIER_API_USERNAME']}:#{ENV['MIDDLE_TIER_API_PASSWORD']}@#{ENV['MIDDLE_TIER_API_HOST']}"

  self.primary_key = 'capture_seq_nbr'
  
  #############################
  #     Instance Methods      #
  #############################
  
  def is_customer_image(customer_name)
    Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_nbr, cust_name_eq: customer_name}).count > 0
  end
  
  def mov?
    File.extname(file_name) == ".mov" or File.extname(file_name) == ".MOV"
  end

  def hidden?
    if respond_to?(:hidden)
      return hidden == 1
    else
      return false
    end
  end

  #############################
  #       Class Methods      #
  #############################
  
  def self.container_number(ticket_number)
    image = Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_number, container_nbr_present: true}).first
    if image.blank?
      return nil
    else
      return image["container_nbr"]
    end
  end

  def self.booking_number(ticket_number)
    image = Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_number, booking_nbr_present: true}).first
    if image.blank?
      return nil
    else
      return image["booking_nbr"]
    end
  end

  def self.contract_number(ticket_number)
    image = Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_number, contr_nbr_present: true}).first
    if image.blank?
      return nil
    else
      return image["contr_nbr"]
    end
  end

  def self.customer_number(ticket_number)
    image = Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_number, cust_nbr_present: true}).first
    if image.blank?
      return nil
    else
      return image["cust_nbr"]
    end
  end

  def self.location(ticket_number)
    image = Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_number, location_present: true}).first
    if image.blank?
      return nil
    else
      return Image.find(image["capture_seq_nbr"]).location
    end
  end

  def self.branch_code(ticket_number)
    image = Image.get(:ransack_search, :q => {ticket_nbr_eq: ticket_number, branch_code_present: true}).first
    if image.blank?
      return nil
    else
      return Image.find(image["capture_seq_nbr"]).branch_code
    end
  end

end
