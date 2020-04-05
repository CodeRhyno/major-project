class PagesController < ApplicationController

  def index
    if user_signed_in?
      if current_user_admin?
        redirect_to admin_panel_index_path
      else
        redirect_to user_panel_index_path
      end
    end
  end

end
