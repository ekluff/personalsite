class Image < ActiveRecord::Base
  has_one :exif
  has_attached_file :asset, styles: { large: "2000x2000>", medium: "768x768>", small: "240x240>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates :asset, attachment_presence: true
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  # after_post_process  :post_process_photo

  # Uncomment below and corresponding private method to delete original file after upload. Will not delete parent directory to original image.
  # after_save :destroy_original

  private

  # def post_process_photo
  #   asset = EXIFR::JPEG.new(self.asset.queued_for_write[:original].path)
  #   return unless asset
  #
  #   self.exif.new
  #   self.exif.camera        =  asset.model
  #   self.exif.software      =  asset.software
  #   self.exif.iso           =  asset.iso_speed_ratings.to_i
  #   self.exif.shutter       =  asset.shutter_speed_value.to_s
  #   self.exif.aperture      =  asset.aperture_value
  #   self.exif.taken         =  asset.date_time_original
  #   self.exif.exposure_bias =  asset.exposure_bias_value.to_s
  #   self.exif.flash         = (asset.flash == 1)
  #   self.exif.focal_length  =  asset.focal_length.to_s
  #   self.exif.lens          =  asset.lens
  #
  # end

  # def destroy_original
  #   File.unlink(self.asset.path)
  # end

end
