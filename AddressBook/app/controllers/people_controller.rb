class PeopleController < ApplicationController
  before_action :ensure_current_user

  def index
    @people = Person.all

    respond_to do |format|
      format.json { render json: @people }
      format.html {}
    end
  end

  def show
    @person = Person.find(params[:id])
    
    respond_to do |format|
      format.json { render json: @person }
      format.html {}
    end
  end

  def new
    @person = Person.new

    respond_to do |format|
      format.json { render json: @person }
      format.html {}
    end
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.json { render json: @person, status: :created }
        format.html { redirect_to @person, notice: 'Post was successfully created.' }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end

  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update(person_params)
        format.json { render json: @person }
        format.html { redirect_to people_url }
      else
        format.json { render json: @person.errors, status: :unprocessable_entity }
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to root_path, status: :see_other
  end


  private
  def person_params
    params.require(:person).permit(
      :salutation,
      :first_name,
      :middle_name,
      :last_name,
      :ssn,
      :birth_date,
      :comment
    )
  end

end
