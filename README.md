Shamay Osipov and Malcolm Wells (Period 3)

Description: We will be creating a workable Oware game and incorporating AI algorithms.

Instructions:
- Open any of the .pde files and all of them will open in processing.
- Run driver.pde through processing and enjoy!
- Although instructions are included in the game, here is a link to official rules: http://en.wikipedia.org/wiki/Oware

What Works:
- two player game interface is fully functional
- AI computer algorithms in place for single player play
- visual displays and animations
- mouse input

Features to Add:
- saved scores
- different levels of AI difficulty
- highlighted possible moves
- highlighted last opponent's move
- possible keyboard input

What Doesn't:
- Everything works.

Data Structure Highlights:
- the prominent data structure used is the Double Linked List
- intially, we used a single linked list to connect the pits on the board since the movement of the seeds is strictly counter-clockwise, meaning that only a point to the next pit is needed.
- as we decided on the variation of Mancala to use, having a pointer to the previous pit was necessary, leading us to use a double linked list
- the Pit.pde file contains the majority of the Double Linked List code
