class ImageFile < ActiveRecord::Base
  
  mount_uploader :file, ImageFileUploader
  
  belongs_to :user
  belongs_to :image
  belongs_to :blob
  
  after_commit :sidekiq_blob_and_image_creation, :on => :create # To circumvent "Can't find ModelName with ID=12345" Sidekiq error, use after_commit
  
  
  #############################
  #     Instance Methods      #
  ############################
  
  def default_name
    self.name ||= File.basename(file_url, '.*').titleize
  end
  
  def sidekiq_blob_and_image_creation
    ImageBlobWorker.perform_async(self.id) # Create the image record and the blob in the background
  end
  
  #############################
  #     Class Methods      #
  #############################
end