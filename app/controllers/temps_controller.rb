class TempsController < ApplicationController
  
  def index
   
  if params[:woeid]
    @woeid = params[:woeid]
  else 
    @woeid = 2487956
  end 

   @response = Weather.lookup(@woeid, Weather::Units::FAHRENHEIT)

   @title = @response.title
   @temp = @response.condition.temp 
   @condition = @response.condition.text
   @image = @response.image.url

   if @condition == "Sunny"
    @background = "yellow"
   elsif @condition == "Partly Cloudy"
    @background = "powderblue"
   else    
    @background = "grey"
   end 
   
 end
end 

