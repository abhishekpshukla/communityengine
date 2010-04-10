class ConvertAvatar < ActiveRecord::Migration
  include PaperclipMigrations

  def self.up
    model_name = [:photos, :homepage_features, :assets]
    model_name.each do |m|
      add_paperclip_fields m, :avatar
      model = m.to_s.classify.constantize 
      model.reset_column_information
      model.all.each do |obj|
        populate_paperclip_from_attachment_fu(obj, obj.avatar, 'avatar') if obj.avatar
      end
        
      remove_column m, :parent_id
      remove_column m, :content_type
      remove_column m, :size
      remove_column m, :filename
      remove_column m, :thumbnail
      remove_column m, :width
      remove_column m, :height
    end
  end

end

