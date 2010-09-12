class User < ActiveRecord::Base
  acts_as_authentic

  def admin?
    manageable_users = ["bvsatyaram", "iqcoord", "iqvol", "angel"]
    manageable_users.include?(self.username)
  end
end
