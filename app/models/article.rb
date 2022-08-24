class Article < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :model, presence: true
    validates :price, presence: true

    def image_as_thumbnail
        return unless image.content_type.in?(%w[image/jpeg image/png])
    
        image.variant(resize_to_limit: [300, 300]).processed
    end
    
    def pictures_as_thumbnails
        pictures.map do |picture|
          picture.variant(resize_to_limit: [150, 150]).processed
        end
    end
    
    def pictures_as_thumbnail(pic)
        pic.variant(resize_to_limit: [150, 150]).processed
    end
end
