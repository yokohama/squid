class DashboardController < ApplicationController

  #before_filter :authenticate_user!
  before_filter :authenticate_actor

  layout "dashboard"

  def index
    @informations = Information.all(order: 'created_at desc', limit: 5)
  end

end
