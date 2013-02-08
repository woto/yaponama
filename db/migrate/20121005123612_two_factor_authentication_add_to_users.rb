class TwoFactorAuthenticationAddToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string   :second_factor_pass_code     , :limit => 32
      t.integer  :second_factor_attempts_count, :default => 0
    end
  end
end
