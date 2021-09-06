class ReportsController < ApplicationController
  before_action :set_report, only: %i[show update destroy]
  before_action :admin?, only: %i[create destroy]

  # GET /reports
  def index
    @user.admin? 
    @reports = @user.admin? ? Report.all : @user.reports
    render json: @reports
  end

  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = @user.reports.new(report_params)
    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def report_params
    params.permit(:name, :user_id, :latitude, :longitude, :description, :address, :start_date, :finish_date, :cost, 
    :employee_id)
  end
end
