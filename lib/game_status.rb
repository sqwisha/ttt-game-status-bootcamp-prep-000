# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top_row_win
  [3, 4, 5], #mid_row_win
  [6, 7, 8], #bot_row_win
  [0, 3, 6], #lef_col_win
  [1, 4, 7], #mid_col_win
  [2, 5, 8], #rig_col_win
  [0, 4, 8], #ri_diag_win
  [6, 4, 2]  #le_diag_win
  ]

  
def won?(board)
  empty = board.all?{|cell| cell == " " || cell == nil}
  
  draw = board.all?{|i| i == "X" || i == "O"}
  
  if empty
    return false
    elsif draw
      return false
  end
  
  WIN_COMBINATIONS.select do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2] 
    
    position_1 = board[win_index_1] 
    position_2 = board[win_index_2] 
    position_3 = board[win_index_3] 
    if (position_1 == position_2) && (position_2 == position_3) && (position_3 == position_1)
        if position_1 == "X" || position_1 == "O"
          return win_combination
        else
          false
        end
    end
  end
end


def full?(board)
  board.any?{|i| i != "" || i = " "}
end

def draw?(board)
  !!won?(board) && full?(board) ? true : false
end
