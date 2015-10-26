#!/usr/bin/env python
import time
import sys
import profile
import os

def rec(start, end):
	res = []
	tmp = []
	for i in range(start[0], end[0] + 1):
		for j in range(start[1], end[1] + 1):
			if ((i >= boardX) or (j >= boardY)):
				tmp.append('_')
				continue
			tmp.append(board[i][j])
		res.append("".join(tmp))
		tmp = []
	return "".join(res)

def toArray(s, x, y):
	return [s[i*y:i*y+y] for i in range(x)]

def fusion(m, n):
	if not m:
		return n
	return ''.join(['_' if n[i] == '_' and m[i] == '_' else 'X' for i in range(len(n))])

def fusionList(l):
	rec1 = ""
	rec2 = ""
	for i in range(len(l) - 1):
		if (i % 2):
			continue
		rec2 = rec(l[i], l[i+1])
		rec1 = fusion(rec1, rec2)
	return rec1

def point(o, m, d):
	(x, y) = (o[0], o[1])
	res = []
	res.append([x, y])
	while True:
		x += m[0]
		y += m[1]
		if ((x >= boardX) or (y >= boardY)):
			res.append([x, y])
			return res
		if board[x][y] == 'X':
			return False
		res.append([x, y])
		x += d[0]
		y += d[1]
		if ((x >= boardX) or (y >= boardY)):
			res.append([x, y])
			return res
		if board[x][y] == 'X':
			return False
		res.append([x, y])
	
def decal(m):
	center = [0, 0]
	res = []
	for d in range(insMax - insMin + 1):
		addPath = area(m, d)
		for a in addPath:
			diff = diffVec(a, m)
			res.append(diff)
	return res

def diffVec(x1, x2):
	return [x1[0] - x2[0], x1[1] - x2[1]]

def area(ori, dis):
	x = ori[0]
	y = ori[1]
	b = dis + x + y
	return [[i, b-i] for i in range(x, dis + x + 1) if board[i][b-i] != 'X']

def genMove(move, startX, startY, endX, endY, board, path):
	if startX == endX and startY == endY:
		path.append(move)
		return 1
	if startX > endX or startY > endY:
		return 0
	if board[startX][startY] == 'X':
		return 0
	if genMove(move + 'R', startX, startY + 1, endX, endY, board, path):
		return 1
	if genMove(move + 'D', startX + 1, startY, endX, endY, board, path):
		return 1
	return 0

def goBack(x, y):
	if board[x][y] == ' ':
		return 1
	if x == 0 and y == 0:
		board[x][y] = ' '
		return 1
	if x < 0 or y < 0:
		return 0
	if board[x][y] == 'X':
		return 0
	if goBack(x, y - 1):
		board[x][y] = ' '
		return 1
	if goBack(x - 1, y):
		board[x][y] = ' '
		return 1
	board[x][y] = 'X'
	return 0

def findPath(x, y):
	if x >= boardX or y >= boardY:
		return 1
	if board[x][y] == '_':
		return 1
	if board[x][y] == 'X':
		return 0
	if findPath(x, y + 1):
		board[x][y] = '_'
		return 1
	if findPath(x + 1, y):
		board[x][y] = '_'
		return 1
	board[x][y] = 'X'
	return 0

def parse_grid():
	res = []
	tmp = []
	index = 0
	for i in terrain:
		tmp.append(i)
		index += 1
		if index % boardX == 0:
			res.append(tmp)
			tmp = []
	return res

def search(move):
	for m in move:
		for d in decal(m):
			#print "Thread", thread.get_indent(), "testing", m, d
			#print (os.getpid(), "testing", m, d)
			l = point([0,0], m, d)
			if (l):
				str2 = fusionList(l[1::])
				rec2 = toArray(str2, d[0] + 1, d[1] + 1)
				path2 = []
				if (genMove('', 0, 0, len(rec2) - 1, len(rec2[0]) - 1, rec2, path2) == 0):
					continue   
				path1 = []
				str1 = fusionList(l)
				rec1 = toArray(str1, m[0] + 1, m[1] + 1)
				if (genMove('', 0, 0, len(rec1) - 1, len(rec1[0]) - 1, rec1, path1) == 0):
					continue  
				#print (path1, path2)
				f = open('run.res', 'w')
				f.write(path1[0] + path2[0])
				f.close()
				return      

def preproces():
	sys.setrecursionlimit(2000)
	for i in range(boardX):
		for j in range(boardY):
			if board[i][j] != 'X':
				goBack(i, j)
	for i in range(boardX):
		for j in range(boardY):
			if board[i][j] != 'X':
				findPath(i, j)

# Main program #
f = open('run.data', 'r')
terrain = f.readline()
insMax = int(f.readline())
insMin = int(f.readline())
boardX = boardY = int(f.readline())
f.close()
board = parse_grid()
print ("Preprocessing")
t1 = time.time()
preproces()
print ("Preproces take", time.time() - t1, "seconds")   
res = []
for i in board:
	res.append(''.join(i))
board = res
# Generate all move #
t2 = time.time()
move = area([0, 0], insMin)
search(move)
print ("Search take", time.time() - t2, "seconds")
#profile.run('search(move)')
print ("Processus", os.getpid(), "Total time :", time.time() - t1, "seconds")
