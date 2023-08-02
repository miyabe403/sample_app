class List < ApplicationRecord
  has_one_attached :image  # Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができます。
end
