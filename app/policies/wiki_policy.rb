class WikiPolicy < ApplicationPolicy
  def update?
    user.present?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
