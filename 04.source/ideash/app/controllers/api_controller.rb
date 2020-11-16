class ApiController < ApplicationController
  def get_wordgacha_jsons
    require 'csv'
    require 'json'
    require 'securerandom'

    @gacha_num = params[:gacha_num].to_i

    csv =CSV.read("app/assets/csv/word_list.csv")

    csv_words = []
    length_csv = csv.length

    for i in 1..@gacha_num do
      random_num = rand(1..length_csv)
      csv_words.push(csv[random_num])
    end

    json_words =  csv_words.to_json

    render :json => json_words
  end
end
