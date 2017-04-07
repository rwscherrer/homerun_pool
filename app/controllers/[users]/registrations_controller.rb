class [users]::RegistrationsController < Devise::RegistrationsController

prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  GET /resource/sign_up
  def new
    super
  end

  POST /resource
  def create
    super
  end

  GET /resource/edit
  def edit
    super
  end

  PUT /resource
  def update
    super
  end

  DELETE /resource
  def destroy
    super
  end

    def show
    end


    protected

    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource)
    end

  end


end
