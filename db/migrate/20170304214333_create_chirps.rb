class CreateChirps < ActiveRecord::Migration[5.0]
  def change
    create_table :chirps do |x|
      x.text         :body
      x.references   :user, foreign_key: true
      x.timestamps
    end
  end
end
