class VisitedToursStorage
  def initialize(session)
    @session = session
  end

  def tour_ids
    @session[:visited_tour_ids] ||= []
  end

  def add_tour_id(tour_id)
    tour_ids.unshift(tour_id).uniq!
    self
  end

  def remove_tour_id(id)
    !!tour_ids.delete(id)
  end

  def tours_without_current(current_id, count = 3)
    visited_tour_ids = (tour_ids - [current_id]).first(count)
    visited_tour_ids.map{|id| Tour.find(visited_tour_ids).detect{|tour| tour.id == id.to_i}}
  end
end