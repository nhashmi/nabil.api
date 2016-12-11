class DateSelectorsController < ApplicationController
  def new
  end

  def create
    date = params[:date_selector]
    year = date["date(1i)"]
    month = date["date(2i)"]
    day = date["date(3i)"]
    redirect_to "/records/#{year}/#{month}/#{day}"
  end
end
