class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
    #空の値に対してのエラー
    validates :name, presence: true, on: :update    
    #空の値と重複に対してのエラー
    validates :email, {presence: true, uniqueness: true, on: :update}
    #空の値に対してのエラー
    validates :gender, presence: true

  has_many :posts, dependent: :destroy
  has_many :searches, dependent: :destroy
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #Relationshipの多対多表記       
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  # ユーザーをフォローする
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # ユーザーをフォロー解除する
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    following.include?(other_user)
  end
  
# 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    super && !deleted_at  
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
  
  
  #画像      
  mount_uploaders :image_names, ImageUploader
   serialize :image_names, JSON
   
end
