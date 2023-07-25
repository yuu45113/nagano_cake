class ApplicationController < ActionController::Base
    before_action :authenticate_customer!, except: [:top,:about, :new]
    
  # def after_sign_in_path_for(resource)
  #     customers_my_page_path
  # end
   
end
