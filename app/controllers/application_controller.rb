class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :age_culc

  def age_culc(birthday)
      birthday = Date.parse(birthday.strftime("%Y-%m-%d")) 
      return (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
  
end
