class IdeasController < ApplicationController
  require 'csv'

  def read_release_note_csv
    CSV.read("app/assets/csv/release_note.csv", headers: true, return_headers: false)
  end

  def home
    @release_note = read_release_note_csv
  end

  def history
    @user = User.find_by(id: current_user.id)
    @categories = IdeaCategory.all.index_by(&:id)
  end

  def category
  end

end