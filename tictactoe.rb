class TicTacToe

   def initialize
        @game = Game.new("Chris", "Lisa")
    end

   class Game
        attr_accessor :player1, :player2

       def initialize (player1, player2)
            @player1 = Player.new(player1)
            @player2 = Player.new(player2)
            @winning = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
            @symbol1 = "X"
            @symbol2 = "O"

           self.start
        end


       def start
            introduction
            player_names
            player_assignment
            display_board(@winning)
            play_game
        end

       def introduction
            puts "Welcome to TicTacToe. We will now randomly choose who goes first. Press any key to begin."
            puts ""
            @@input = gets.chomp
        end

       def player_names
            puts "Please enter the name of a player."
            name1 = gets.chomp
            puts ""
            puts "Please enter the name of another player."
            name2 = gets.chomp

           @player1.name = name1
            @player2.name = name2
        end

       def player_assignment
            @x = rand(10)   

           if @x <= 5
                @player1.symbol = @symbol1
                @player2.symbol = @symbol2
                puts ""
                puts "#{player1.name} is assigned #{@symbol1} and #{player2.name} is assigned #{@symbol2}"
                puts ""
            else
                @player1.symbol = @symbol2
                @player2.symbol = @symbol1
                puts ""
                puts "#{player1.name} is assigned #{@symbol2} and #{player2.name} is assigned #{@symbol1}"
                puts ""
            end
        end

       def play_game
            count = 0
            if @player1.goes_first? == true
                while count < 8
                    check_board(@player1.play, @player1.symbol)
                    announce_winner(is_winner?(@player1))
                    count += 1

                   check_board(@player2.play, @player2.symbol)
                    announce_winner(is_winner?(@player2))
                    count += 1
                end
            else
                while count < 8
                    check_board(@player2.play, @player2.symbol)
                    announce_winner(is_winner?(@player2))
                    count += 1

                   check_board(@player1.play, @player1.symbol)
                    announce_winner(is_winner?(@player1))
                    count += 1
                end
            end
            end_game
        end

       def display_board(array)
            puts ""
            print "  #{array[0][0]}  |   #{array[0][1]}  |   #{array[0][2]} \n"
            puts "------------------"
            print "  #{array[1][0]}  |   #{array[1][1]}  |   #{array[1][2]} \n"
            puts "------------------"
            print "  #{array[2][0]}  |   #{array[2][1]}  |   #{array[2][2]}"
            puts "\n"
        end

       def check_board(move, symbol)
            @move = move.to_i
            @symbol = symbol

           @winning.each do |array|
                array.map! do |num|
                    if num.is_a?(String)
                        num
                    elsif(@move == num)
                        @symbol
                    elsif @move != num && num.is_a?(Integer)
                        num        
                    end
                end
            end
            display_board(@winning)
            puts ""
        end

       def is_winner?(player)

           @winning.any? do |line|
                line.all? {|position| position == player.symbol}
            end
        end

       def announce_winner(x)
            @x = x

           if @x == true
                puts "You've won, congratulations"
                display_board(@winning)
                exit
            else
                return
            end
        end


[15:20] 
def end_game
            puts "GAME OVER"
            exit
        end
    end

   class Player
        attr_accessor :name, :symbol

       def initialize(name)
            @name = name
        end

       def play
            puts "#{@name}, your symbol is #{self.symbol}."
            puts "Please select a square represented."
            input = gets.chomp
            puts "#{@name} selected #{input} and a #{symbol} will be placed in that position."
            puts ""
            return input
        end

       def goes_first?
            if self.symbol == "X"
                return true
            else
                return false    
           end
        end
    end
end
