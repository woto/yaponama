module GuestOrUser
  def self.included(base)
    base.class_eval {
      # Для выборки из корзины и т.д. Другими словами где не требуется регистрация
      scope :guest_or_user, lambda { |user, session_id|
        unless user.nil?
          where(:user_id => user.id)
        else
          where(:session_id => session_id)
        end
      }
    }
  end
end