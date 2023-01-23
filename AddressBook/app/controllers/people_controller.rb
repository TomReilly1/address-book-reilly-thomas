class PeopleController < ApplicationController
  before_action :ensure_current_user
  before_action :get_user
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @people = Person.where(user_id: session[:user_id])
  end

  def show
  end

  def new
    @person = @user.people.new
  end

  def create
    @person = @user.people.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Post was successfully created.'
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to people_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @person.destroy

    redirect_to root_path, status: :see_other
  end


  private
  def get_user
    @user = User.find(session[:user_id])
  end

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(
      :salutation,
      :first_name,
      :middle_name,
      :last_name,
      :ssn,
      :birth_date,
      :comment,
      :user_id
    )
  end

end
