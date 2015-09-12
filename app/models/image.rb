class Image < ActiveRecord::Base
  has_attached_file :asset, styles: { large: "2000x2000>", medium: "768x768>", small: "240x240>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :asset, content_type: /\Aimage\/.*\Z/

  after_save :destroy_original

  private

  def destroy_original
    File.unlink(self.asset.path)
  end

end
