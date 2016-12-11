class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new]

  def index
    @records = Record.all
    render json: @records
  end

  def today
    today = Date.today
    @record = Record.find_by(year: today.year, month: today.month, day: today.day)
    if @record
      redirect_to @record
    else
      render 'new'
    end
  end

  def show
    @record = find_record
    render json: @record
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(params[:record])
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

  def find_record
    Record.find_by(
      year: params[:year],
      month: params[:month],
      day: params[:day]
    )
  end
end
