class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, presence: true

  belongs_to :filial

  validates :nome, :filial, :presence => true
  before_create :generate_token

  has_many :formularios, through: :filial
  has_many :formulario_ps


  def master?
    tipo == 1
  end


  protected

  def generate_token
    self.auth_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(auth_token: random_token)
    end
  end
end
