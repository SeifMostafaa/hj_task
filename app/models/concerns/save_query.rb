module SaveQuery
  def self.save(query, session_id, articles)
    
    return if query.nil? || query.length < 3

    recent_query = Analytic.new(query: query, articles: articles)
    recent_query.session_id = session_id

    previous_query = Analytic.where(session_id: session_id).last

    if should_save_new_query?(previous_query, query)
      recent_query.save
    elsif should_update_previous_query?(previous_query, query)
      p"============================="
      p"============================="
      previous_query.update(query: query, articles: articles)
    end
  end

  private

  def self.should_save_new_query?(previous_query, current_query)
    previous_query.nil? || !previous_query.searched?(current_query)
  end

  def self.should_update_previous_query?(previous_query, current_query)
    previous_query && (previous_query.query.length == current_query.length)
  end
end
