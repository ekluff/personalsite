class Image < ActiveRecord::Base
  has_one :exif, dependent: :destroy
  accepts_nested_attributes_for :exif

  has_attached_file :asset,
    styles: {
      large: "2000x2000>",
      medium: "768x768>",
      small: "240x240>",
      thumb: "100x100>" },
    default_style: :medium,
    convert_options: {
      all: "-strip",
    }

  validates :asset, attachment_presence: true
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  after_post_process  :save_exif

  # Uncomment below and corresponding private method to delete original file after upload. Will not delete parent directory to original image.
  # after_save :destroy_original

  private

  def save_exif
    asset = EXIFR::JPEG.new(self.asset.queued_for_write[:original].path)
    return unless asset

    self.create_exif({
      camera:          asset.model,
      software:        asset.software,
      iso:             asset.iso_speed_ratings.to_i,
      shutter:         asset.shutter_speed_value.to_s,
      aperture:        asset.aperture_value,
      taken:           asset.date_time_original,
      exposure_bias:   asset.exposure_bias_value.to_s,
      flash:          (asset.flash == 1),
      focal_length:    asset.focal_length.to_s,
    })
  end

  # uncomment below and corresponding call above to delete original file after upload. Will not delete parent directory.
  # def destroy_original
  #   File.unlink(self.asset.path)
  # end

end
