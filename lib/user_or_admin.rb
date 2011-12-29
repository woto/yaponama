module UserOrAdmin
  def self.included(base)
    base.class_eval {
      scope :user_or_admin, lambda { |user|
        unless user.admin?
          where(:user_id => user.id)
        end
      }
    }
  end
end