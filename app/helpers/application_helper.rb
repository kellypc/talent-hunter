module ApplicationHelper
  def is_admin_path
    request.path_info.include?("admin")
  end
end
