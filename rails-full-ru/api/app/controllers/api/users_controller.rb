# frozen_string_literal: true

class Api::UsersController < Api::ApplicationController
  # BEGIN
  def index
    respond_with User.all
  end

  def show
    respond_with User.find_by(id: params[:id])
  end
  # END
end
