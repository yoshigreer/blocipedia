class WikiPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize (user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        puts "admin"
        scope.all
      elsif user.standard?
        puts "standard"
        scope.where(private: false)
      elsif user.premium?
        puts "premium"
        user_wikis = []
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user == user
            user_wikis << wiki
          end
        end
        user_wikis
      end
    end
  end
end
