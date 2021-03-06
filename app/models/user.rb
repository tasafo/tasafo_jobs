class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :jobs,    dependent: :destroy
  has_one   :resume,  dependent: :destroy
  has_one   :setting, dependent: :destroy

  after_create do
    Setting.create(user: self)
  end
end
