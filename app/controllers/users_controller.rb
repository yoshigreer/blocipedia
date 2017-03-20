class UsersController < ApplicationController
  def downgrade
    current_user.update_attribute(:role, 'standard')
    flash[:notice] = "Your subscription was downgraded to standard."
    redirect_to root_path
  end
end
