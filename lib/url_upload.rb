module UrlUpload
  def data_from_url(uri)
    io = (open(URI.parse(uri)) rescue return nil)
    (class << io; self; end;).class_eval do
      define_method(:original_filename) { base_uri.path.split('/').last }
    end
    io
  end
  
  def validate
    errors.add("filename", "is invalid") if avatar_file_name? && %w(index.html index.htm).include?(avatar_file_name.downcase)
  end
      
end