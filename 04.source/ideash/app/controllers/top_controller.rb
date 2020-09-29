class TopController < ApplicationController
  require 'csv'
  skip_before_action :authenticate_user!

  def index
    @release_note = read_release_note_csv
  end

  def release_note
    @release_note = read_release_note_csv
  end

  private

  def read_release_note_csv
    CSV.read("app/assets/csv/release_note.csv", headers: true, return_headers: false)
  end
end