module ApplicationHelper
  
  def transactions_sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == transactions_sort_column) ? "current #{transactions_sort_direction}" : nil
    direction = (column == transactions_sort_column && transactions_sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:transactions_sort => column, :transactions_direction => direction, :page => nil), {:class => css_class}
  end
  
  def cards_sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == cards_sort_column) ? "current #{cards_sort_direction}" : nil
    direction = (column == cards_sort_column && cards_sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:cards_sort => column, :cards_direction => direction, :page => nil), {:class => css_class}
  end
  
end
