class AllNewsRepresenter
  include Rails.application.routes.url_helpers
  attr_reader :all_news

  def initialize(all_news)
    @all_news = all_news
  end

  def to_json
    @all_news.map do |news|
      NewsRepresenter.new(news).to_json
    end
  end
end
