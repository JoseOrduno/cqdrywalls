class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show update destroy]

  # GET /photos
  def index
    report_id = request.headers["report_id"]
    @report = Report.find_by(report_id)
    @photos= @report.photos

    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    @report = Report.find_by(id: params[:report_id])
    @photo = @report.photos.new(url: params[:image_file], report_id: params[:report_id])

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def photo_params
    params.permit(:image_file, :report_id)
  end
end
