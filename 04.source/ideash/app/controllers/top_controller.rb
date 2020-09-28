class TopController < ApplicationController
  require 'csv'
  skip_before_action :authenticate_user!

  def index
  end

  def release_note
    @csv = CSV.read("app/assets/csv/release_note.csv", headers: true, return_headers: false)
  end
end