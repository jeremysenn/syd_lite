class ImagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show_jpeg_image, :show_preview_image]
  before_action :set_image, only: [:show, :edit, :update, :show_jpeg_image, :show_preview_image, :destroy]
  
#  load_and_authorize_resource

  respond_to :html, :js

  def index
    unless params[:q].blank? or params[:today] == true
      @ticket_number = params[:q][:ticket_nbr_eq]
      @start_date = params[:q][:sys_date_time_gteq]
      @end_date = params[:q][:sys_date_time_lteq]
      search = Image.ransack(params[:q])
#      search.sorts = "#{sort} #{direction}"
      search.sorts = "sys_date_time desc"
      
      ### Only show one image per ticket by default, unless there is a ticket number being searched ###
      unless @ticket_number.blank?
        params[:one_image_per_ticket] == '0'
        @images = search.result.page(params[:page]).per(6)
      else
        if params[:one_image_per_ticket] == '1' or not params[:one_image_per_ticket] == '0'
          @images = search.result
          @images = Kaminari.paginate_array(@images.to_a.uniq { |image| image.ticket_nbr }).page(params[:page]).per(6)
        else
          @images = search.result.page(params[:page]).per(6)
        end
      end
      
    else # Show today's tickets
      # Default search to today's images
      @today = true
#      search = Image.ransack(:sys_date_time_gteq => Date.today, :sys_date_time_lteq => Date.today.tomorrow)
      search = Image.ransack(:sys_date_time_gteq => Date.today, :sys_date_time_lteq => Date.today.tomorrow)
      params[:q] = {}
      @start_date = Date.today.to_s
      @end_date = Date.today.tomorrow.to_s
      search.sorts = "sys_date_time desc"
      @images = search.result
      @images = Kaminari.paginate_array(@images.to_a.uniq { |image| image.ticket_nbr }).page(params[:page]).per(6)
#      @images = search.result.page(params[:page]).per(8).to_a.uniq { |image| image.ticket_nbr }.reverse # Get only one of each ticket number
    end
  end

  def show
    @ticket_number = @image.ticket_nbr
    respond_with(@image)
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    @image.save
    respond_with(@image)
  end

  def update
    @image.update(image_params)
    respond_with(@image)
  end
  
  def show_jpeg_image
    send_data @image.jpeg_image, :type => 'image/jpeg',:disposition => 'inline'
  end
  
  def show_preview_image
    send_data @image.preview, :type => 'image/jpeg',:disposition => 'inline'
  end
  
  def destroy
    @image.destroy
    respond_with(@image)
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:amount, :to_account, :from_account, :fee, :customer_id)
    end
end
