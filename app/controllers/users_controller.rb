class UsersController < ApplicationController
  def downgrade
    current_user.update_attribute(:role, 'standard')

    @user = current_user
    user_private_wikis = @user.wikis.where(private: true)
    user_private_wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end

    flash[:notice] = "Your subscription was downgraded to standard."
    redirect_to root_path
  end
end
