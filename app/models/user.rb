class User < ActiveRecord::Base
  rolify
  attr_accessor :login
  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
  has_many :comments
  
  def user_params
    params.require(:user).permit(:login, :username, :email, :password, :password_confirmation, :subscribe)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
