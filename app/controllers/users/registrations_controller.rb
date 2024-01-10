class Users::RegistrationsController < Devise::RegistrationsController
  # ここに新規登録コントローラーのカスタム内容を追加
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream { render turbo_stream: turbo_stream.append(:some_dom_id, partial: "users/show", locals: { user: @user }) }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(:errors, partial: "shared/errors", locals: { resource: @user }) }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end