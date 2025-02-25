class Round
  attr_reader :deck, :turns
    def initialize(deck)
      @deck = deck
      @turns = []
    end

    def current_card
       @deck.cards.first
    end

    def take_turn(guess)
      new_turn = Turn.new(guess, current_card)
      @turns << new_turn
      deck.cards.shift
      new_turn
    end

    def number_correct
      correct = []
      turns.each do |turn|
        if turn.correct? == true
          correct << turn
        end
      end
      correct.count
    end

    def percent_correct
      (number_correct.to_f / turns.count) * 100
    end

    def number_correct_by_category(category)
      correct_cat = 0
      turns.each do |turn|
        if turn.correct? == true && turn.card.category == category
          correct_cat += 1
      end
    end
    correct_cat.to_f
  end

  def turns_by_category(category)
    turns_cat = 0
    turns.each do |turn|
      if turn.card.category == category then
        turns_cat += 1
      end
    end
    turns_cat.to_f
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category) / turns_by_category(category)) * 100.round(1)
  end

end
