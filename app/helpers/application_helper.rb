module ApplicationHelper
  def tab_active?(link)
    "active" if link.to_s == controller_name.to_s && action_name == "index"
  end
end
