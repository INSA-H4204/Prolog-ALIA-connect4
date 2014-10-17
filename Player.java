import java.util.Vector;
 
public class Player {
        
        
        /**
         * Performs a move
         * 
         * @param pState
         *            the current state of the board
         * @param pDue
         *            time before which we must have returned
         * @return the next state the board is in after our move
         */
        public GameState play(final GameState pState, final Deadline pDue) {
 
                Vector<GameState> lNextStates = new Vector<GameState>();
                pState.findPossibleMoves(lNextStates);
                int index = Integer.MAX_VALUE;
                int player = pState.getNextPlayer();
                int previous = Integer.MIN_VALUE;
                int next;
                for(int i=0; i<lNextStates.size(); i++) {
                        next = alphaBeta(lNextStates.get(i), 9, previous, Integer.MAX_VALUE, false, player);
                        if(next > previous) {
                                previous = next;
                                index = i;
                        }
                }
                return lNextStates.get(index);
        } // End Play
        
        /**
         * Implementation of Alpha-Beta algorithm.
         * @param pState The GameState being evaluated.
         * @param depth The maximum depth allowed.
         * @param alpha Alpha.
         * @param beta Beta.
         * @param player True if player, false if other player.
         * @param playerColor The constant corresponding to either Red or White pieces.
         * @return
         */
        private int alphaBeta(GameState pState, int depth, int alpha, int beta, boolean player, int playerColor) {
                Vector<GameState> lNextStates = new Vector<GameState>();
                pState.findPossibleMoves(lNextStates);
                
                
                //If depth = 0 or node is a terminal node
                if(depth == 0 || pState.isEOG()) {
                        if(pState.isRedWin() && playerColor == 1 || pState.isWhiteWin() && playerColor == 2) {
                                return Integer.MAX_VALUE;
                        } else if(pState.isRedWin() && playerColor == 2 || pState.isWhiteWin() && playerColor == 1) {
                                return Integer.MIN_VALUE;
                        } else if(pState.isDraw()) {
                                return 0;
                        } else {
                                return calculatePoints(playerColor, pState);
                        }
                } // End if
                
                
                
                if(player) {
                        for(GameState state : lNextStates) {
                                alpha = Math.max(alpha, alphaBeta(state, depth-1, alpha, beta, false, playerColor));
                                if(beta <= alpha) {
                                        break;
                                }
                        }
                        return alpha;
                } else {
                        for(GameState state : lNextStates) {
                                beta = Math.min(beta, alphaBeta(state, depth-1, alpha, beta, true, playerColor));
                                if(beta <= alpha) {
                                        break;
                                }
                        }
                        return beta;
                }
        }
        
        /**
         * Calculates the number of points the state gives a player.
         * 
         * @param playerColor The color of the player. 1 for red and 2 for white.
         * @param state The current state of the game.
         * @return The number of points.
         */
        private int calculatePoints(int playerColor, GameState state) {
                int value = 0;
                if(playerColor == 1) {
                        for(int i=1; i<=32; i++) {
                                if(state.get(i) == 1) {
                                        value = value + 160 + i;
                                } else if(state.get(i) == 5) {
                                        value = value + 230 + i;
                                } else if(state.get(i) == 2) {
                                        value = value - 100 - i;
                                } else if(state.get(i) == 6) {
                                        value = value - 170 - i;
                                }
                                
                        }
                } else {
                        for(int i=1; i<=32; i++) {
                                if(state.get(i) == 2) {
                                        value = value + 160 + 33 - i;
                                } else if(state.get(i) == 6) {
                                        value = value + 230 + 33 - i;
                                } else if(state.get(i) == 1) {
                                        value = value - 100 - 33 + i;
                                } else if(state.get(i) == 5) {
                                        value = value - 170 - 33 + i;
                                }
                        }
                }
                return value;
        }
        
        
} // End class Player
