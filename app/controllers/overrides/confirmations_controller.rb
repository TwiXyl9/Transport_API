class Overrides::ConfirmationsController < DeviseTokenAuth::ConfirmationsController
  def show
    @resource = resource_class.confirm_by_token(resource_params[:confirmation_token])

    if @resource.errors.empty?
      yield @resource if block_given?

      if signed_in?(resource_name)
        token = signed_in_resource.create_token
        signed_in_resource.save!
      end

      render json: {} , status: :ok
    else
      render json: {error: 'Account has already been confirmed.'}, status: :unprocessable_entity
    end
  end
end
