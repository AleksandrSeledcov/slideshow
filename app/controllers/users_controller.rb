class UsersController < ApplicationController
  before_filter :authenticate_user!
  require 'net/ftp'

  def profile
  	@Galleries = Gallery.all
    @gallery_names = []
    @Galleries.each { |gallery| @gallery_names.push gallery.name  }
  end

  def upload 
    newImage = Image.create(:name => params[:image_name], :url =>'', :user_id => current_user.id, :slideshow_id => params[:gallery_name])    
    file = params[:file]
    @url = 'http://ant478.esy.es/' + newImage.id.to_s + '_' + file.original_filename
    ftp = Net::FTP.new('ftp.ant478.esy.es')
    ftp.login(user = 'u347184519', passwd = 'enigma')
    ftp.storbinary("STOR " + newImage.id.to_s + '_' + file.original_filename, StringIO.new(file.read), Net::FTP::DEFAULT_BLOCKSIZE)
    ftp.quit()
    newImage.update_attributes(:url => @url)
  end

  def delete_image
  end

  def create_slideshow
    Gallery.create(:name => params[:gallery_name], :description => params[:gallery_description], :user_id => current_user.id)
  end

  def delete_slideshow
    @Galleries = Gallery.all
    @Galleries.each { |gallery|
      if gallery.name == params[:gallery_name]
        gallery.destroy
        break
      end
    }
    
  end

end
