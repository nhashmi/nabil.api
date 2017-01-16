class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]

  def index
    @records = Record.all
    render json: @records
  end

  def yesterday
    yesterday = Date.yesterday
    redirect_to "/records/#{yesterday.year}/#{yesterday.month}/#{yesterday.day}"
  end

  def show
    @record = find_record
    render json: @record
  end

  def date
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    @record = Record.find_by(date: Date.new(year, month, day))
    if @record
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render json: @record }
      end
    else
      @record = Record.new(date: Date.new(year, month, day))
      render 'new'
    end
  end

  def new
    @record = Record.new(date: params[:date])
  end

  def create
    @record = current_user.records.new(record_params)
    if @record.save
      date = @record.date
      redirect_to "/records/#{date.year}/#{date.month}/#{date.day}"
    else
      render 'new'
    end
  end

  def edit
    @record = find_record
  end

  def update
    @record = find_record
    @record.update!(record_params)
    redirect_to '/date', notice: "Record updated successfully"
  end

  def destroy
    @record = find_record
    @record.destroy!
    redirect_to root_url
  end

  private

  def record_params
    params.require(:record).permit(:running, :running_details, :lifting, :lifting_details, :dqs, :code, :code_details, :writing, :writing_details, :business, :business_details, :date, :citizenship, :citizenship_details, :reading, :reading_details, :work, :work_details, :family, :extended_family, :bored, :bored_details, :diy, :diy_details)
  end

  def find_record
    Record.find_by(date: params[:date])
  end
end
