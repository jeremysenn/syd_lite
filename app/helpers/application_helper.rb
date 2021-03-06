module ApplicationHelper
  
  def device_state_descriptions
    ["Ready", "Disconnected", "Waiting for Up response", "Waiting for Down response", "Waiting for Status", "Down", "Waiting for Transaction reply", 
      "Waiting for Down response (to begin load)", "Loading...", "Waiting for Config", "Supervisor mode", "Wait Reset", "Wait Read Cassettes", 
      "Wait Present", "Wait Totals", "Wait Reset Totals", "Wait Present", "Wait Test Dispense", "Wait Test Reject", "Wait Totals pre-Dispense", 
      "Wait Totals after Timeout", "Wait for Reset on bad dispense", "No Server", "Unknown", "Wait for ID", "Wait for Read Cassettes before redispense", 
      "Waiting for notes to be rejected", "Waiting for notes to be rejected", "Waiting for Lifts Up", "Waiting for new key", "Waiting for user response", 
      "Waiting for Bill Pay screen", "Waiting for bill pay amount", "Waiting for Bill Pay Confirmation", ""]
  end
  
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
  
  def devices_sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == devices_sort_column) ? "current #{devices_sort_direction}" : nil
    direction = (column == devices_sort_column && devices_sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:devices_sort => column, :devices_direction => direction, :page => nil), {:class => css_class}
  end
  
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
 
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
            concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
        end
        nil
      end
  
    end

    
    