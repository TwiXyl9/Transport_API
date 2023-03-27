class NewsRepresenter
  include Rails.application.routes.url_helpers
  attr_reader :news

  def initialize(news)
    @news = news
  end

  def to_json
    {
      id: @news.id,
      title: @news.title,
      description: @news.description,
      image: @news.image_url
    }
  end
end