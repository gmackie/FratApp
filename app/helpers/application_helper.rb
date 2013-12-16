module ApplicationHelper

  def public_pages
    [root_path, about_path, help_path, contact_path, destroy_user_session_path, new_user_session_path, new_user_registration_path, new_user_password_path]
  end
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
