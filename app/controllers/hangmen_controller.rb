class HangmenController < ApplicationController
	def index
  	@hangmen = Hangman.all
    random_position = @hangmen.length
    @hangman = @hangmen[rand(random_position)]
  end 

  def show
  	@hangman = Hangman.find(params[:id])
  	@hangman.lives = 6
    @word = @hangman.word
    @hangman.word_encrypted = "_ " * @word.length
    @hangman.save
  end

  def letter
  	@hangman = Hangman.find(params[:id])
  	@hangman.word_encrypted = @hangman.check_letter(params[:letter])
  	@hangman.save
		render 'show'
  end

  def word
  	@hangman = Hangman.find(params[:id])
  	@hangman.word_encrypted = @hangman.check_word(params[:word])
		render 'show'
  end
end
