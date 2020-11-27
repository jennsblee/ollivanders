module ApplicationHelper
  module CarouselHelper
  def carousel_for(images)
    Carousel.new(self, images).html
  end

  class Carousel
    def initialize(view, images)
      @view, @images = view, images
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      view.content_tag(:div, content, class: 'carousel slide')
    end

    private

    attr_accessor :view, :images
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view
  end
  end
end
