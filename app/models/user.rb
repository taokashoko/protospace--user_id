class User < ApplicationRecord

  # ユーザー名（name）のバリデーション
  validates :name, presence: true

  # プロフィール（profile）のバリデーション
  validates :profile, presence: true

  # 所属（occupation）のバリデーション
  validates :occupation, presence: true

  # 役職（position）のバリデーション
  validates :position, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :prototypes
  has_many :comments
end
