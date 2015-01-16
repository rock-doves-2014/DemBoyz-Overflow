class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
  end

  def new
    @tag = Tag.new
  end

end