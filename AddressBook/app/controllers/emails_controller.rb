class EmailsController < ApplicationController
  before_action :ensure_current_user
  before_action :get_person
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  
  def index
  end
  
  def new
    @email = @person.emails.build
  end
    
  def create
    @email = @person.emails.build(email_params)
    
    if @email.save
      redirect_to person_path(@person)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @email.destroy

    redirect_to root_path, status: :see_other
  end

  
  private
    def get_person
      @person = Person.find(params[:person_id])
    end

    def set_email
      @email = @person.emails.find(params[:id])
    end

    def email_params
      params.require(:email).permit(
        :email_address,
        :comment
      )
    end   
end
