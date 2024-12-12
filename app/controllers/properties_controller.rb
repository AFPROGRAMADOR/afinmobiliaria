class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  
    # Lista de propiedades
    def index
      @properties = Property.all
    end
  
    # Mostrar una propiedad específica
    def show
    end
  
    # Formulario para crear una nueva propiedad
    def new
      @property = Property.new
    end
  
    # Guardar la nueva propiedad
    def create
      @property = current_user.properties.build(property_params)
      if @property.save
        redirect_to @property, notice: 'Propiedad creada exitosamente.'
      else
        # Mostrar los errores si la propiedad no se guarda
        flash.now[:alert] = @property.errors.full_messages.join(", ")
        render :new
      end
    end
    
  
    # Formulario para editar una propiedad existente
    def edit
    end
  
    # Actualizar propiedad existente
    def update
      if @property.update(property_params)
        redirect_to @property, notice: 'Propiedad actualizada exitosamente.'
      else
        render :edit
      end
    end
  
    # Eliminar propiedad
    def destroy
      @property.destroy
      redirect_to properties_path, notice: 'Propiedad eliminada exitosamente.'
    end
  
    private
  
    # Encontrar propiedad por ID
    def set_property
      @property = Property.find(params[:id])
    end
  
    # Permitir solo parámetros seguros
    def property_params
      params.require(:property).permit(:title, :description, :price, :location, :status, :image)
    end
  end
  