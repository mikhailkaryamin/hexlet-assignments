# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    (user&.id == post.author_id) || user&.admin
  end

  def update?
    (user&.id == post.author_id) || user&.admin
  end

  def destroy?
    user&.admin
  end

  # END
end
