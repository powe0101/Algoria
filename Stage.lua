isTutorialClear = true
isSpringClear = true
isSummerClear = true
isFallClear = true
isWinterClear = true

isTutorialClear = true
isSpringClear = false
isSummerClear = false
isFallClear = false
isWinterClear = false

stageClearLevel = 1
stageClearForItem = {} --리스트이자 메소드처럼 쓰임.

function InitStageClear()
	stageClearForItem = {SpringStageClear, SummerStageClear, FallStageClear, WinterStageClear}
end

function SpringStageClear()
  isSpringClear = true
end

function SummerStageClear()
  isSummerClear = true
end

function FallStageClear()
  isFallClear = true
end

function WinterStageClear()
  isWinterClear = true
end
