require 'json'

class AddressesController < ApplicationController
  before_action :ensure_current_user
  before_action :get_person
  before_action :set_address, only: [:show, :edit, :update, :destroy]


  def index
  end

  def new
    @address = @person.addresses.build
    
    file = File.read('./app/assets/json/countries.json')
    @countries = JSON.parse(file)
  end
  
  def create
    @address = @person.addresses.build(address_params)

    if @address.save
      redirect_to person_path(@person)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @address = Address.find(params[:id])
    
    file = File.read('./app/assets/json/countries.json')
    @countries = JSON.parse(file)
  end

  def update
    if @address.update(address_params)
      redirect_to person_path(@person)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy

    redirect_to root_path, status: :see_other
  end
  
  
  private
    def get_person
      @person = Person.find(params[:person_id])
    end

    def set_address
      @address = @person.addresses.find(params[:id])
    end

    def address_params
      params.require(:address).permit(
        :street,
        :town,
        :state,
        :zip,
        :country
      )
    end
end
