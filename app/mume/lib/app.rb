# frozen_string_literal: true
require_relative "mume/version"
require_relative "mume/util"
require_relative "mume/data"
require_relative "mume/char"
require_relative "mume/screen"

class App
  attr_accessor :prompt, :screen, :char

  def initialize
    @prompt      = TTY::Prompt.new
    @char        = Char.new
    @screen      = Screen.new
    @screen.app  = self
    @screen.char = @char
  end

  def run
    loop do
      @screen.mume()
    
    # just rescue any error cause im lazy then restart
    rescue
      retry 
    end
  end
end
