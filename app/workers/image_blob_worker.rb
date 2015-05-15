class ImageBlobWorker
  include Sidekiq::Worker
  
  def perform(image_file_id)
    image_file = ImageFile.find(image_file_id)

    # Create blob
    if image_file.file.content_type.start_with? 'image'
      thumbnail_image_blob_data = Magick::Image::read(Rails.root.to_s + "/public" + image_file.file_url(:thumb).to_s).first.to_blob
      large_image_blob_data = Magick::Image::read(Rails.root.to_s + "/public" + image_file.file_url(:large).to_s).first.to_blob
    else # Assume only pdf's for now
      thumbnail_image_blob_data = Magick::Image::read(Rails.root.to_s + "/public" + image_file.file_url(:thumb).to_s).first.to_blob
      large_image_blob_data = open(image_file.file.path).read
    end
    # Only need to Base64 encode when passing it over the network
#    blob = Blob.create(:preview => Base64.encode64(thumbnail_image_blob_data), :jpeg_image => Base64.encode64(large_image_blob_data), :sys_date_time => image_file.created_at)
    
    blob = Blob.create(:preview => thumbnail_image_blob_data, :jpeg_image => large_image_blob_data, :sys_date_time => image_file.created_at)

    # Create image
    image = Image.create(:file_name => File.basename(image_file.file_url), :branch_code => image_file.branch_code, :location => image_file.location, :ticket_nbr => image_file.ticket_number,
      :container_nbr => image_file.container_number, :booking_nbr => image_file.booking_number, :contr_nbr => image_file.contract_number, :blob_id => blob.id, :camera_name => image_file.user.email, :camera_group => "Scrap Yard Dog",
      :sys_date_time => image_file.created_at, :event_code => image_file.event_code, :cust_nbr => image_file.customer_number, :hidden => image_file.hidden)

    # Save new image_file data
    image_file.image_id = image.id
    image_file.blob_id = blob.id

    # Remove the newly uploaded file and versions
#    image_file.remove_file!

    image_file.save
  end
end