class ClippingImage < Asset
  include UrlUpload
  #has_attachment prepare_options_for_attachment_fu(AppConfig.clipping['attachment_fu_options'])
  has_attached_file :avatar,
                    :style => AppConfig.photo['paperclip_options']['style'],
                    :storage =>AppConfig.photo['paperclip_options']['storage']
                  
  validates_attachment_presence     :avatar
  validates_attachment_content_type :avatar, :content_type => AppConfig.photo['paperclip_options']['content_type'], :allow_nil => true
  #validates_as_attachment
end