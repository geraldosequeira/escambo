#rails g controller backoffice/dashboard index

class Backoffice::DashboardController < ApplicationController
  layout "admin"

  def index
  end
end
