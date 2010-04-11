xml.instruct!

xml.gallery do 
  xml.album :title=>:photos.l(:count => @photos.size), :lgPath=>"", :tnPath=>"" do 
    @photos.each do |photo|
      xml.img :src=> photo.avatar.url(:large), :tn=> photo.avatar.url(:thumb), :link => user_photo_url(@user, photo)
    end
  end
end
