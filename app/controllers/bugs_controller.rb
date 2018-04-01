class BugsController < ApplicationController
  before_action :set_user
  before_action :set_user_post, only: [:show, :update, :destroy]

  # GET /authors/:author_id/posts
  def index
    json_response(@user.posts)
  end

  # GET /authors/:author_id/posts/:id
  def show
    json_response(@bug)
  end

  # POST /authors/:author_id/posts
  def create
    # @author.posts.create!(post_params)
    @user.bugs.create!(bug_params)
    json_response(@user, :created)
  end

  # PUT /authors/:author_id/posts/:id
  def update
    # @post.update(post_params)
    @bug.update(bug_params)
    head :no_content
  end

  # DELETE /authors/:author_id/posts/:id
  def destroy
    @bug.destroy
    head :no_content
  end

  private

  def bug_params
    params.permit(:title, :description, :issue_type, :priority, :status)
  end
  def set_user
    @user = User.find(params[:user_id])
  end
  def set_user_post
    @bug = @user.bugs.find_by!(id: params[:id]) if @user
  end
end
