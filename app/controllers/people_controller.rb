class PeopleController < ApplicationController
  before_filter :filter_people

  def index
    render json: @people, root: false
  end

  private

  def filter_people
    @people = if params[:search].present?
      Person.search(params[:search])
    else
      Person.all
    end
  end
end
