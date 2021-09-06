class ApplicationController < ActionController::Base
  before_aucion :authenticate_user!
  
end
