class TagsController < ApplicationController
  before_action :validate_user, except: [:index, :show]

  def index
    @tags = Tag.search(params[:search])
    if params[:search]
      @tags = Tag.search(params[:search]).order("created_at DESC")
    else
      @tags = Tag.all.order('created_at DESC')
    end
  end


  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.get_tag_questions
  end

  def new
    @tag = Tag.new
  end


  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      redirect_to tags_path(@tag)
    else
      render :new
    end
  end


  private

  def tag_params
    params.require(:tag).permit(:title)
  end

end
