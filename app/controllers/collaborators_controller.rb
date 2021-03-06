class CollaboratorsController < ApplicationController
  def create
    # raise params.inspect

    wiki = Wiki.find_by(id: params["/collaborators"][:wiki_id])
    user = User.find_by(email: params["/collaborators"][:email])

    if user.nil?
      flash[:notice] = "User not found."
    elsif Collaborator.where(user: user, wiki: wiki).first
      flash[:notice] = "#{user.email} is already a collaborator."
    else
      if Collaborator.create!(user: user, wiki: wiki)
        flash[:notice] = "#{user.email} is now a collaborator."
      else
        flash[:error] = "Error"
      end
    end

    redirect_to wiki_path
  end

  def destroy
    @collaborator = Collaborator.find_by(user_id: params[:user_id], wiki_id: params[:id])

    # raise collaboration.inspect

    if @collaborator.destroy
      flash[:notice] = "#{@collaborator.user.email} was removed."
    else
      flash[:error] = "Could not remove collaborator."
    end
    redirect_to wiki_path
  end
end
