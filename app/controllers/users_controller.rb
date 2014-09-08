class UsersController < ApplicationController
  before_filter :authenticate_user!

  def profile
  	@users = User.all
  end

  def upload 
  	@file = params['file']
  	@name = @file.original_filename
  end

  def delete_image
  end

  def create_slideshow
  end

  def delete_slideshow
  end

end
