module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if css_class = column == sort_column
      "current #{sort_direction}"
    else
      nil
    end
    if direction = column == sort_column && sort_direction ==
      "asc"
      "desc"
    else
      "asc"
    end
    link_to title, { sort: column, direction: direction },
      class: css_class
  end
end
