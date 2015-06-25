class Micropost
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  default_scope -> { order(created_at: :desc) }  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }


  field :content,				type: String
  field :yes,					type: Integer
  field :no,					type: Integer


end
