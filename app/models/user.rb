class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       
  has_many :image_files
  has_many :shipment_files
  has_one :user_setting
  
  after_commit :create_user_settings, :on => :create
  
  #############################
  #     Instance Methods      #
  ############################
  
  def create_user_settings
    UserSetting.create(user_id: id)
  end
  
  def show_thumbnails?
    user_setting.show_thumbnails?
  end
  
  def images_table?
    user_setting.table_name == "images"
  end
  
  def shipments_table?
    user_setting.table_name == "shipments"
  end
  
  #############################
  #     Class Methods      #
  #############################
end
