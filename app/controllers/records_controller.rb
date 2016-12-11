class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :create, :destroy]

  def index
    @records = Record.all
    render json: @records
  end

  def today
    today = Date.today
    redirect_to "/records/#{today.year}/#{today.month}/#{today.day}"
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
      redirect_to @record
    else
      render 'new'
    end
  end

  def edit
    @record = find_record
  end

  def update
    @record = find_record
    @record.update!(params[:record])
    redirect_to @record
  end

  def destroy
    @record = find_record
    @record.destroy!
    redirect_to root_url
  end

  private
  def record_params
    params.require(:record).permit(:running, :lifting, :dqs, :code, :writing, :business, :date, :citizenship, :reading, :work, :family, :extended_family, :bored, :diy)
  end

  def find_record
    Record.find_by(date: params[:date])
  end
end