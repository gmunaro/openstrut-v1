$CONSOLE:ONLY
DIM SHARED TestFails AS INTEGER, TestCount AS INTEGER
AssertNear "near", 1.0001#, 1#, 0.001#
AssertEq "eq", "ABC", "ABC"
AssertTrue "true", (2 > 1)
TestEnd
'$INCLUDE: 'ASSERT.BM'
