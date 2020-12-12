package Rummikub;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

public class Board {
	protected ArrayList<ArrayList<Tile>> board = new ArrayList<ArrayList<Tile>>();

	public Board() {
	}

	//Add a new set to the board
	public void addSet(ArrayList<Tile> set) {
		set = addJoker(set);
		board.add(set);
		Collections.sort(board.get(board.size()-1), new Comparator<Tile>() {
			@Override
			public int compare(Tile tile1, Tile tile2){return  Integer.compare(tile1.getValue(), tile2.getValue());}
		});
	}

	//Add specific tiles from hand to board
	public void addToCurrent(ArrayList<Tile> tiles, int row){
		ArrayList<Tile> checkRow = board.get(row);
		checkRow.addAll(tiles);
		checkRow = addJoker(checkRow);
		board.set(row,checkRow);
		Collections.sort(board.get(row), new Comparator<Tile>() {
			@Override
			public int compare(Tile tile1, Tile tile2){return  Integer.compare(tile1.getValue(), tile2.getValue());}
		});
	}

	//Separates a current set on the board into two sets
	public void separateSet(int row, int tileNum){
		ArrayList<Tile> newSet = new ArrayList<Tile>();
		if(row < board.size() && board.get(row).size() > tileNum) {
			for (int i = tileNum; i < board.get(row).size(); i++) {
				newSet.add(board.get(row).get(i));
			}
			int size = board.get(row).size();
			for (int i = tileNum; i < size; i++) {
				board.get(row).remove(tileNum);
			}
			board.add(newSet);
		}
	}

	//combine two sets that's are currently on the board
	public void combineCurrent(int sourceRow, int destinationRow, ArrayList<Integer> tiles){
		ArrayList<Tile> moving = new ArrayList<Tile>();
		for(int i = 0; i < tiles.size(); i++){
			moving.add(board.get(sourceRow).get(tiles.get(i)-1));
		}
		for(int i = 0; i < tiles.size(); i++){
			board.get(sourceRow).remove(board.get(sourceRow).get(tiles.get(i) - i -1));
		}
		ArrayList<Tile> checkDestination = board.get(destinationRow);
		checkDestination.addAll(moving);
		checkDestination = addJoker(checkDestination);
		board.set(destinationRow,checkDestination);
		// if moving all tiles from source row, remove the empty row
		if(board.get(sourceRow).size() == 0) {
			board.remove(sourceRow);
		}
		for(int i = 0; i < board.size(); i++) {
			Collections.sort(board.get(i), new Comparator<Tile>() {
				@Override
				public int compare(Tile tile1, Tile tile2) {
					return Integer.compare(tile1.getValue(), tile2.getValue());
				}
			});
		}
	}

	public String printHelper() {
		String printBoard = "";
		int size = 0;
		for (int i = 0; i < board.size(); i++) {
			if(i < 9) {
				printBoard += "0" + Integer.toString(i+1) + "|  ";
			}else {
				printBoard += Integer.toString(i+1) + "|  ";
			}
			if (board.get(i).size() > size){
				size = board.get(i).size();
			}
			for (int j = 0; j < board.get(i).size(); j++) {
				if (board.get(i).get(j).getColor() == Tile.Colors.JOKER) {
					printBoard += board.get(i).get(j).getColor() + "}  ";
				} else {
					printBoard += board.get(i).get(j).getValue() + "  ";
					printBoard += board.get(i).get(j).getColor() + "}  ";
				}
			}
			printBoard += "\n";
		}
		for(int i = 0; i < ((size * 18) + 1); i++) {
			printBoard+="-";
		}
		return printBoard;
	}


	// Checks if the board is valid with all the modified rows
	// Used for ending turns to see if what player did is valid
	public boolean checkBoard() {
		for (int i = 0; i < board.size(); i++) {
			int type = 0;
			int valueCorrect = 0;
			Tile.Colors color = null;
			ArrayList<Tile.Colors> colors = new ArrayList<Tile.Colors>();
			if(board.get(i).size() < 3){
				return false;
			}
			for (int j = 0; j < board.get(i).size() - 1; j++) {
				if(board.get(i).get(j).getColor() != Tile.Colors.JOKER && color == null){
					color = board.get(i).get(j).getColor();
				}
				colors.add(board.get(i).get(j).color);
				if( board.get(i).get(j).getValue() == board.get(i).get(j + 1).getValue() - 1 && (board.get(i).get(j).getColor() == Tile.Colors.JOKER || (board.get(i).get(j).getColor() == color && board.get(i).get(j+1).getColor() == color ||  board.get(i).get(j+1).getColor() == Tile.Colors.JOKER)) && (type == 0 || type == 1)) {
					valueCorrect++;
					type = 1;
				} else {
					if(board.get(i).get(j).getValue() == board.get(i).get(j + 1).getValue() && (!colors.contains(board.get(i).get(j+1).getColor()) && colors.size() < 4) && (type == 0 || type == 2)){
						valueCorrect++;
						type = 2;
					}
				}
			}
			if(valueCorrect != board.get(i).size()-1){
				return false;
			}
		}
		return true;
	}


	public ArrayList<Tile> addJoker(ArrayList<Tile> row){
		for(int i = 0; i < row.size(); i++) {
			if (row.get(i).getColor() == Tile.Colors.JOKER){
				if(row.size() == 1){
					Tile tile = new Tile(1, Tile.Colors.JOKER);
					row.add(tile);
					return row;
				}
				if(i == 0 &&row.get(1).getValue() == row.get(2).getValue()) {
						row.get(i).setValue(row.get(i + 1).getValue());
						return row;
				}
				else if (i == 1 && row.get(0).getValue() == row.get(2).getValue()) {
						row.get(i).setValue(row.get(i + 1).getValue());
						return row;
					}
				else if (i == 2 && row.get(0).getValue() == row.get(1).getValue()) {
					row.get(i).setValue(row.get(i - 1).getValue());
					return row;
				} else {
					row.remove(i);
					Collections.sort(row, new Comparator<Tile>() {
						@Override
						public int compare(Tile tile1, Tile tile2) {
							return Integer.compare(tile1.getValue(), tile2.getValue());
						}
					});
					for (int j = 0; j < row.size() - 1; j++) {
						if (row.get(j).getValue() != row.get(j + 1).getValue() - 1) {
							Tile tile = new Tile(row.get(j).getValue() + 1, Tile.Colors.JOKER);
							row.add(tile);
							return row;
						}
					}
					if (row.get(row.size()-1).getValue() == 13) {
						Tile tile = new Tile(row.get(0).getValue() - 1, Tile.Colors.JOKER);
						row.add(tile);
						return row;
					} else {
						Tile tile = new Tile(row.get(row.size()-1).getValue() + 1, Tile.Colors.JOKER);
						row.add(tile);
						return row;
					}
				}
			}
		}
		return row;
	}

	public ArrayList<Tile> getRow (int index) {
		return board.get(index);
	}

	public int getBoardSize() {
		return board.size();
	}


	// this function checks if there are tiles of indices
	// this is used for checking indices for moving tiles
	public boolean hasTiles(int srcRow, int[] tilesIndex) {
		for (int index: tilesIndex) {
			if (board.size() < srcRow || board.get(srcRow).size() < index)
				return false;
		}
		return true;
	}
}