class Portfolio < ApplicationRecord
    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.django
        where(subtitle: "Django")
    end

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= "https://placehold.co/600x400"
        self.thumb_image ||= "https://placehold.co/350x200"
    end
end
