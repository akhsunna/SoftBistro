# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  process :resize_to_fit => [400, 400]

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :mini do
    process :resize_to_fill => [50, 50]
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path('fallback/' + [version_name, 'default-avatar.png'].compact.join('_'))
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
