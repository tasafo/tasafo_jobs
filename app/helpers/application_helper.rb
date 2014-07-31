module ApplicationHelper
  def tab_active?(_controller, _action, logic = true)
    "active" if _controller.to_s == controller_name && action_name == _action.to_s && logic
  end
end
