class ArticlesController < ApplicationController
  before_action :ensure_session

  def show
    @article = Article.find(params[:id])
  end

  def search
    if query_present?
      articles = Article.get_title(search_query)
      render_home_partial(articles)
      SaveQuery.save(search_query, session[:user_id], articles.size)
    else
      render_home_partial([])
    end
  end

  private

  def ensure_session
    session[:user_id] ||= SecureRandom.urlsafe_base64(16)
  end

  def query_present?
    search_query.present?
  end

  def search_query
    params[:query]
  end

  def render_home_partial(articles)
    render(partial: '/shared/home', locals: { articles: articles })
  end
end
