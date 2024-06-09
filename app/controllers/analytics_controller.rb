class AnalyticsController < ApplicationController
  def index
    @top_queries = fetch_top_queries
  end

  private

  def fetch_top_queries
    Analytic
      .group( :query, :updated_at, :articles)
      .pluck('query, count(query) as counter, articles, updated_at')
      .sort_by do |a|
        a[1]
      end.reverse.first(10)
  end
end
