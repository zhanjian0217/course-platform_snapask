# frozen_string_literal: true

module Owner
  class BaseController < ApplicationController
    before_action :authenticate_user! 
    before_action :authenticate_admin 
  end
end
