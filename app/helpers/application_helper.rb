module ApplicationHelper
  def current_class?(test_path)
    if request.path == test_path
      return 'item active'
    else
      return 'item'
    end

  end
end
