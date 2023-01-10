class PhoneNumbersController < ApplicationController
  before_action :ensure_current_user
  before_action :get_person
  before_action :set_phone_number, only: [:show, :edit, :update, :destroy]

  
  def index
  end

  def new
    @phone_number = @person.phone_numbers.build
  end
    
  def create
    @phone_number = @person.phone_numbers.build(phone_number_params)
    
    if @phone_number.save
      redirect_to person_path(@person)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @phone_number.destroy

    redirect_to root_path, status: :see_other
  end

    
  private
    def get_person
      @person = Person.find(params[:person_id])
    end

    def set_phone_number
      @phone_number = @person.phone_numbers.find(params[:id])
    end

    def phone_number_params
      params.require(:phone_number).permit(
        :phone_number,
        :comment
      )
    end
end
