class List < ApplicationRecord
  has_one_attached :image  # Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができます。
  
  validates :title, presence: true  # validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェックします。
  validates :body, presence: true  # trueと記述すると、データが存在しなければならないという設定になります。
  validates :image, presence: true
end
