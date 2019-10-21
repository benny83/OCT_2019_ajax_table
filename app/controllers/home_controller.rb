class HomeController < ApplicationController
  def index
    @users = User.filter_by(
      company: params[:company],
      gender: params[:gender],
      active: params[:active]
    ).paginate(page: params[:page], per_page: 20)
  end
end
