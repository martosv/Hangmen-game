class Hangman < ActiveRecord::Base

	def check_letter letter_input
		letters_checked = []
		not_found = false
		letter = letter_input.downcase
  	word = self.word.downcase
			if word.include? letter
				index_letter_found = (0 ... word.length).find_all { |i| word[i] == letter }
				letters_checked << {letter => index_letter_found}
				letters_checked.each do |letter|
					letter.each do |key, value|
						value.each do |val|
							self.word_encrypted[val*2] = key.upcase
						end
					end
				end
				not_found = false
			else
				not_found = true
			end
		if not_found
			self.lives -= 1
			self.save
			game_over(self.lives)
		else
			word_encrypted = self.word_encrypted.split().join().downcase
			if word_encrypted == word
				self.word_encrypted = word_encrypted.upcase + " => YOU WIN!!"
			end
		end
		self.word_encrypted
	end

	def check_word word_input
		word_input = word_input.downcase
  	word = self.word.downcase
		if word == word_input
			self.word_encrypted = self.word.upcase + " => YOU WIN"
		else
			self.lives = 0
			self.word_encrypted = "GAME OVER"
		end
		self.word_encrypted
	end

	def game_over(lives)
		if lives <= 0
			self.word_encrypted = "GAME OVER"
		end
	end
end
