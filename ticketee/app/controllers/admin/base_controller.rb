# a class that the other controllers inside the admin namespace can inherit from
class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
end