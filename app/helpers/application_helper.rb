module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", danger: "alert-danger",  error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "container mt-2 alert-dismissible alert alert-#{bootstrap_class_for(msg_type)} text-center text-muted") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def parse_created_at date
    date.strftime('%d/%m/%Y às %H:%M:%S') rescue date
  end

  def parse_date date
    date.strftime('%d/%m/%Y') rescue date
  end

  def parse_time time
    time.strftime('%H:%M') rescue time
  end

  def disable_with(message = '')
    "<span style='width: 100%;' class='text-center m-2'><i class='fa fa-circle-notch fa-spin text-primary'></i>#{message}</span>".html_safe
  end

  def parse_boolean_status status
    return "<span class='btn btn-success btn-round'>Ativo</span>".html_safe  if status
    "<span class='btn btn-round'>Inativo</span>".html_safe unless status
  end
end
