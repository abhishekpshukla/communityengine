class HomepageFeature < ActiveRecord::Base  
  has_attached_file :avatar,
                    :styles => AppConfig.photo['paperclip_options']['style'],
                    :storage =>AppConfig.photo['paperclip_options']['storage']

  #attr_accessible :url, :title, :description

  validates_attachment_presence :avatar
  validates_attachment_content_type :avatar, :content_type => AppConfig.photo['paperclip_options']['content_type'], :allow_nil => true

  validates_presence_of :url#, :if => Proc.new{|record| record.parent.nil? }
  
  def self.find_features
    find(:all, :order => "created_at DESC")
  end

end
