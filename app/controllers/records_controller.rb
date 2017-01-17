class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create]

  def index
    @records = Record.all
    render json: @records
  end

  def yesterday
    yesterday = Date.yesterday
    redirect_to "/records/#{yesterday.year}/#{yesterday.month}/#{yesterday.day}"
  end

  def date
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    @record = Record.find_by(date: Date.new(year, month, day))
    if @record
      respond_to do |format|
        format.html { redirect_to action: 'edit' }
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
    year = params[:year].to_i
    month = params[:month].to_i
    day = params[:day].to_i
    @record = Record.find_by(date: Date.new(year, month, day))
  end

  def update
    @record = Record.find_by(date: params[:record][:date])
    if @record.update(record_params)
      redirect_to "/date", notice: "Record updated successfully"
    else
      render 'edit', error: "Error: #{@record.errors}"
    end
  end

  private

  def record_params
    params.require(:record).permit(:id, :running, :running_details, :lifting, :lifting_details, :dqs, :code, :code_details, :writing, :writing_details, :business, :business_details, :date, :citizenship, :citizenship_details, :reading, :reading_details, :work, :work_details, :family, :extended_family, :diy, :diy_details)
  end

  def find_record
    Record.find_by(date: params[:date])
  end
end
