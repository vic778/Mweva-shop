class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index; end

  # def only_admin
  #     if current_user.role.name != 'admin'
  #       action = params[:action]
  #     else
  #       render json: { error: "Only the admin can perform this action" }, status: :unauthorized
  #     end
  # end
end
